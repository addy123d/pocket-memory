#!/usr/bin/env node

import chalk from "chalk";
import inquirer from "inquirer";
import gradient from "gradient-string";
import chalkAnimation from 'chalk-animation'
import figlet from "figlet";
import { createSpinner } from "nanospinner";
import { SerialPort, ByteLengthParser } from "serialport";
import fs from 'fs';

const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

let serialport;
let selected_port = '';
let selectedBaudRate = 9600;
let isSerialConnectionEstablished = true;
let operation_code = '00';
let DEVICE_CODE = 0;
let responseTimeoutId;
let responseDataEndId;
let payload = {};
let SEQUENCE_LEN = 2;
let PACKET_START_SEQUENCE = ['3A', '23'];
let PACKET_END_SEQUENCE = ['0D', '0A'];


const menu = Object.freeze({
    PING: '11',
    WRITE: '01',
    READ: '02',
    UPDATE: '03',
    DELETE: '04',
    EXIT: 'X'
});

// Create a parser instance
const parser = new ByteLengthParser({ length: 1 });

// Function to display data with ASCII art
function displayData(data) {
    console.log(chalk.red('║                         ' + decimalToHex(data[0]) + '                           ║'));
    console.log(chalk.white('╚═════════════════════════════════════════════════════╝'));
}

parser.on('data', (data) => {
    clearTimeout(responseTimeoutId); //clear response timeout
    clearTimeout(responseDataEndId); //clear response data end timeout
    //display data
    displayData(data);

    responseDataEndId = setTimeout(() => {
        showMenu();

        clearTimeout(responseDataEndId);
    }, 100);
});

function decimalToHex(decimalNum) {
    const hexChars = "0123456789ABCDEF"; // Hexadecimal characters

    if (decimalNum === 0) {
        return "0";
    }

    let hexString = "";
    while (decimalNum > 0) {
        const remainder = decimalNum % 16;
        hexString = hexChars[remainder] + hexString;
        decimalNum = Math.floor(decimalNum / 16);
    }

    return hexString;
}

async function askPORT() {
    console.clear();

    const port = await inquirer.prompt({
        name: 'port_number',
        type: 'input',
        message: 'PORT ',
        default() {
            return 'PORT';
        }
    });

    selected_port = port.port_number; //assign port number to global variable.
}

async function askBAUD() {
    const baudrate = await inquirer.prompt({
        name: 'baud_rate',
        type: 'input',
        message: 'BAUD RATE ',
        default() {
            return 9600;
        }
    });

    const deviceCode = await inquirer.prompt({
        name: 'code',
        type: 'input',
        message: 'Device Code',
        default() {
            return '00';
        }
    });

    DEVICE_CODE = deviceCode.code;

    selectedBaudRate = baudrate.baud_rate; //assign baud rate to global variable.

    //after baud rate selection, save configuration
    saveConfiguration();
}

async function saveConfiguration() {

    openSerialPort();

    const spinner = createSpinner('Connecting...').start();
    await sleep(2000);

    if (isSerialConnectionEstablished) {
        spinner.success({ text: 'Serial port connected ✅' });

        await showMenu();
    } else {
        spinner.error({ text: 'Connection failed, serial port error' });
    }
}

async function showMenu() {
    const spinner = createSpinner('OPERATION CODES').start();

    let menuString = `
    Operation Codes
    ${menu.PING} : PING
    ${menu.WRITE} : WRITE
    ${menu.READ} : READ
    ${menu.UPDATE} : UPDATE
    ${menu.DELETE} : FORMAT DISK (ADMIN ACCESS)
    ${menu.EXIT} : EXIT
    `;

    spinner.success({ text: menuString });

    //give user a prompt to enter operation code
    await selectOperation();
}

async function selectOperation() {

    const operationCode = await inquirer.prompt({
        name: 'operation_code',
        type: 'input',
        message: 'Enter Code',
        default() {
            return '00';
        }
    });

    operation_code = operationCode.operation_code;

    //exit from application
    if (operation_code == menu.EXIT)
        process.exit(1);


    await performOperation();
}

async function performOperation() {
    let OPERATION_CODE = operation_code;
    let payload_data = {}; //it will contain, an array,and its respective length.

    switch(OPERATION_CODE){
        case menu.PING:
            payload_data = createPingData();
            break;
        case menu.WRITE:
            payload_data = createWriteData();
            break;
        case menu.READ:
            break;
        case menu.UPDATE:
            break;
        case menu.DELETE:
            break;
        default:
            console.log(chalk.bgRed("INVALID OPERATION CODE"));
            break;
    }

    sendRequest(payload_data);
}

function createPingData(){
    let pingData = ['00', '00'];

    //generate payload
    payload = {
        data : pingData,
        len : pingData.length
    }

    return payload; //send dummy data, as it a ping request, data doesn't make sense.
}

function createWriteData(){
    let hexString = 'Aditya'; //random password sample
    let hexArr = [];

    //write a code to prompt user to enter string from command line

    //stringtoHex will return an array of hex bytes
    //for example : "Hello, World!" - ['48', '65', '6C', '6C', '6F', '2C', '20', '57', '6F', '72', '6C', '64', '21']
    hexArr = stringtoHex(hexString); 

    //generate payload
    payload = {
        data : hexArr,
        len : hexArr.length
    }

    return payload;
}

function sendRequest(payload_obj){

    //send start sequence first
    for(let i = 0; i < SEQUENCE_LEN; i++){
        send_data_via_uart(Buffer.from([parseInt(PACKET_START_SEQUENCE[i], 16)])); //convert hex string to ascii integer value
        sleep(150);
    }

    //send DEVICE CODE and Operation code
    send_data_via_uart(Buffer.from([parseInt(DEVICE_CODE, 16)])); //convert hex string to ascii integer value
    sleep(150);
    send_data_via_uart(Buffer.from([parseInt(operation_code, 16)])); //convert hex string to ascii integer value
    sleep(150);

    //send payload
    for(let i = 0; i < payload_obj.len; i++){
        send_data_via_uart(Buffer.from([parseInt(payload_obj.data[i], 16)])); //convert hex string to ascii integer value
        sleep(150);
    }

    //send payload length
    send_data_via_uart(Buffer.from([parseInt(decimalToHex(payload_obj.len), 16)])); //convert hex string to ascii integer value
    sleep(150);

    //send end sequence last
    for(let i = 0; i < SEQUENCE_LEN; i++){
        send_data_via_uart(Buffer.from([parseInt(PACKET_END_SEQUENCE[i], 16)])); //convert hex string to ascii integer value
        sleep(150);
    }

    responseTimeoutId = setTimeout(handleTimeout, 2000);
}


// Function to read image file and convert it to byte array
function imageToByteArray(filePath) {
    try {
        // Read the image file as a buffer
        const buffer = fs.readFileSync(filePath);

        // Convert buffer to byte array
        const byteArray = Array.from(buffer);

        return byteArray;
    } catch (error) {
        console.error('Error reading the file:', error);
        return null;
    }
}

// send serial data
async function send_data_via_uart(data) {
    try {
        await new Promise((resolve, reject) => {
            serialport.write(data, (error) => {
                if (error) {
                    reject(error);
                } else {
                    resolve(); //everything goes fine.
                }
            });
        });

        // console.log('Data was written successfully on UART.');
        return true;
    } catch (error) { //if something goes wrong, promise will reject the operation and throw the error.

        console.error('Error writing data:', error.message);

        return false;
    }
}


// Function to handle response timeout
function handleTimeout() {
    const spinner = createSpinner("Retrying...").start();
    spinner.error({ text: `${DEVICE_CODE} not responding, check connections !` });

    showMenu(); //display menu again

    clearTimeout(handleTimeout);
}

function openSerialPort() {
    serialport = new SerialPort({ path: selected_port, baudRate: parseInt(selectedBaudRate) });

    // Pipe serial port data through the parser
    serialport.pipe(parser);

    // Event listener for 'open' event
    serialport.on('open', () => {
        isSerialConnectionEstablished = true;
        // console.log('Serial port opened successfully.');
    });

    // Error handler for the serial port
    serialport.on('error', (error) => {
        isSerialConnectionEstablished = false;
        // console.error('Serial port error:', error.message);
    });

}

function stringtoHex(str) {
    let hexArray = [];
    let charindex = 0;

    for (charindex = 0; charindex < str.length; charindex++) {
        //get ascii value of character
        let asciiValue = str.charCodeAt(charindex);

        //convert ascii value to hex byte
        let hexByte = asciiValue.toString(16).toUpperCase().padStart(2, '0');

        //padStart, pads the string with leading zeros if necessary to ensure it has at least two characters

        hexArray.push(hexByte);
    }

    return hexArray;
}


async function intro() {
    // console.clear();
    const msg = `\r POCKET MEMORY `;

    figlet(msg, (err, data) => {
        console.log(gradient.mind.multiline(data));
    })
}

// const imagePath = './image.png';
// const byteArray = imageToByteArray(imagePath);

// if (byteArray) {
//     console.log('Byte array:', byteArray);
// }

await askPORT();
await askBAUD();
