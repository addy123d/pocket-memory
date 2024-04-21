#!/usr/bin/env node

import chalk, { Chalk } from "chalk";
import inquirer from "inquirer";
import gradient from "gradient-string";
import chalkAnimation from 'chalk-animation'
import figlet from "figlet";
import { createSpinner } from "nanospinner";
import { SerialPort, ByteLengthParser } from "serialport";
import fs, { read } from 'fs';

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
let RESPONSE_DATA = [];
let end_sequence_flag = 0;
let processReadOperation = 0;
let ReadBuffer = [];
let user_entered_string = '';


const menu = Object.freeze({
    PING: '11',
    WRITE_MEM: '1',
    READ_MEM: '2',
    UPDATE_MEM: '3',
    DELETE_MEM: '10',
    SET_PASSWORD: '12',
    AUTH_CHECK: '13',
    EXIT: 'X'
});

const exception = Object.freeze({
    ILLEGAL_ORDER_CODE: '1',
    ILLEGAL_DEVICE_CODE: '2',
    MASTER_PASSWORD_NOT_SET: '3',
    AUTH_FAILED: '4'
});

// Create a parser instance
const parser = new ByteLengthParser({ length: 1 });

// Function to display data with ASCII art
function displayData(data) {
    //below print statements, won't work if data is FF, or operation code selected is read memory or write memory
    if ((decimalToHex(data[0]) != 'FF') && (operation_code == menu.READ_MEM) && (operation_code == menu.WRITE_MEM)) {
        console.log(chalk.red('║                         ' + decimalToHex(data[0]) + '                           ║'));
        console.log(chalk.white('╚═════════════════════════════════════════════════════╝'));
    }

    RESPONSE_DATA.push(decimalToHex(data[0]));
}

parser.on('data', (data) => {
    clearTimeout(responseTimeoutId); //clear response timeout
    clearTimeout(responseDataEndId); //clear response data end timeout

    //display data
    displayData(data);

    //process read operation
    if (processReadOperation)
        RWOperation(data);

    //end sequence processing
    if ((decimalToHex(data[0]) == 'D') && (end_sequence_flag === 0)) {
        end_sequence_flag = 1;
    } else if ((decimalToHex(data[0]) == 'A') && (end_sequence_flag === 1)) {
        end_sequence_flag = 0; //clear end sequence flag

        checkResponse();
        showMenu();
    }



    //set flag to read buffer operation
    if ((decimalToHex(data[0]) == menu.READ_MEM) || (decimalToHex(data[0]) == menu.WRITE_MEM)) {
        processReadOperation = 1;
    }

});


function checkResponse() {
    if (RESPONSE_DATA[3] == 'FE') {  //FE represents exception is raised, instead of order code
        console.log(chalk.bgRed(`${checkExceptionCode(RESPONSE_DATA[4])}`));
    }

    RESPONSE_DATA = [];
}

function checkExceptionCode(code) {
    let exception_msg = '';

    switch (code) {
        case exception.ILLEGAL_ORDER_CODE:
            exception_msg = 'Please send correct operation code';
            break;
        case exception.ILLEGAL_DEVICE_CODE:
            exception_msg = 'Please check device code again';
            break;
        case exception.MASTER_PASSWORD_NOT_SET:
            exception_msg = 'Please set master password for your device';
            break;
        case exception.AUTH_FAILED:
            exception_msg = 'Password not matched, try again...';
            break;
        default:
            break;
    }

    return exception_msg;
}

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

function hexBytesToString(hexBytes) {
    if (operation_code == menu.WRITE_MEM) //if its a write operation, we don't need to convert hex bytes to string
        return hexBytes;

    // Convert each hex byte to its corresponding character
    const chars = hexBytes.map(byte => String.fromCharCode(parseInt(byte, 16)));

    // Join the characters into a single string
    const string = chars.join('');

    return string;
}

function RWOperation(data) {
    let string = '';
    let termination_character = (operation_code == menu.READ_MEM) ? '0' : 'FF';


    if (decimalToHex(data[0]) != termination_character) { //till it reaches null character 0x00
        ReadBuffer.push(decimalToHex(data[0]));
    } else {
        string = (operation_code == menu.READ_MEM) ? (`Stored Credential : ${chalk.bgGreen(`${hexBytesToString(ReadBuffer)}`)}`) : (`START address HIGH : ${chalk.bgGreen(`0x${ReadBuffer[0]}`)}, START address LOW : ${chalk.bgGreen(`0x${ReadBuffer[1]}`)}`);
        console.log(string);

        string = ''; //reset string content
        ReadBuffer = []; //reset buffer

        //credentials reached null character 0x00
        processReadOperation = 0; //unset flag
    }

}


async function askInput() {
    let message = '';
    let type = 'input';

    switch (operation_code) {
        case menu.WRITE_MEM:
            message = "Enter Credential: ";
            break;
        case menu.READ_MEM:
            message = "Enter START ADDR: (HIGH_BYTE, LOW_BYTE)";
            break;
        case menu.UPDATE_MEM:
            message = "";
            break;
        case menu.DELETE_MEM:
            break;
        case menu.SET_PASSWORD: //set master password for eeprom
            message = "Enter Master Password: ";
            type = "password";
            break;
        case menu.AUTH_CHECK:
            message = 'Password: '
            type = "password";
            break;
        default:
            break;
    }

    const user = await inquirer.prompt({
        name: 'string',
        type: type,
        message: message,
        default() {
            return '';
        }
    });

    user_entered_string = user.string;
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
    ${menu.WRITE_MEM} : WRITE
    ${menu.READ_MEM} : READ
    ${menu.UPDATE_MEM} : UPDATE
    ${menu.DELETE_MEM} : FORMAT DISK (ADMIN ACCESS)
    ${menu.SET_PASSWORD} : SET MASTER PASSWORD
    ${menu.AUTH_CHECK} : AUTH TEST
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
    let errorFlag = false;
    let payload_data = {}; //it will contain, an array,and its respective length.

    console.log(OPERATION_CODE);
    switch (OPERATION_CODE) {
        case menu.PING:
            payload_data = createPingData();
            break;
        case menu.WRITE_MEM:
            await askInput();
            payload_data = createWriteData();
            break;
        case menu.READ_MEM:
            await askInput();
            payload_data = createReadData();
            break;
        case menu.UPDATE_MEM:
            break;
        case menu.DELETE_MEM:
            payload_data = [];
            break;
        case menu.SET_PASSWORD: //set master password for eeprom
            await askInput();
            payload_data = createPasswordData();
            break;
        case menu.AUTH_CHECK:
            await askInput();
            payload_data = createAUTHData();
            break;
        default:
            console.log(chalk.bgRed("INVALID OPERATION CODE"));
            errorFlag = true;
            break;
    }

    if (!errorFlag)
        sendRequest(payload_data);

    user_entered_string = '';
}

function createPingData() {
    let pingData = ['00', '00'];

    //generate payload
    payload = {
        data: pingData,
        len: pingData.length
    }

    return payload; //send dummy data, as it a ping request, data doesn't make sense.
}

function createReadData() {
    let readData = user_entered_string.split(","); //AT24 memory 16 bit address, will be stored in this array
    // console.log(readData);
    // let readData = ['00', '14']; 
    //readData[0] is address high byte
    //readData[1] is address low byte

    //generate payload
    payload = {
        data: readData,
        len: readData.length
    }

    return payload; //send dummy data, as it a ping request, data doesn't make sense.
}

function createWriteData() {
    let hexString = user_entered_string; //random password sample
    // let hexString = 'Sneha'; //random password sample
    // console.log(hexString);

    let hexArr = [];

    //write a code to prompt user to enter string from command line

    //stringtoHex will return an array of hex bytes
    //for example : "Hello, World!" - ['48', '65', '6C', '6C', '6F', '2C', '20', '57', '6F', '72', '6C', '64', '21']
    hexArr = stringtoHex(hexString);

    //generate payload
    payload = {
        data: hexArr,
        len: hexArr.length
    }

    return payload;
}

function createPasswordData() {
    // console.log(`User entered: ${chalk.bgYellow(`${user_entered_string}`)}`);
    let hexString = user_entered_string; //random password sample
    // let hexString = 'Aditya';
    let hexArr = [];

    //write a code to prompt user to enter string from command line

    //stringtoHex will return an array of hex bytes
    //for example : "Hello, World!" - ['48', '65', '6C', '6C', '6F', '2C', '20', '57', '6F', '72', '6C', '64', '21']
    hexArr = stringtoHex(hexString);

    //generate payload
    payload = {
        data: hexArr,
        len: hexArr.length
    }

    return payload;
}

function createAUTHData() {
    let hexString = user_entered_string; //random password sample
    // let hexString = "Aditya"; //random password sample
    let hexArr = [];

    //write a code to prompt user to enter string from command line

    //stringtoHex will return an array of hex bytes
    //for example : "Hello, World!" - ['48', '65', '6C', '6C', '6F', '2C', '20', '57', '6F', '72', '6C', '64', '21']
    hexArr = stringtoHex(hexString);

    //generate payload
    payload = {
        data: hexArr,
        len: hexArr.length
    }

    return payload;
}

async function sendRequest(payload_obj) {
    // console.log("Send Request: ");
    // console.log(operation_code);

    //send start sequence first
    for (let i = 0; i < SEQUENCE_LEN; i++) {
        send_data_via_uart(Buffer.from([parseInt(PACKET_START_SEQUENCE[i], 16)])); //convert hex string to ascii integer value
    }



    //send DEVICE CODE and Operation code
    send_data_via_uart(Buffer.from([parseInt(DEVICE_CODE, 16)])); //convert hex string to ascii integer value
    send_data_via_uart(Buffer.from([parseInt(operation_code, 16)])); //convert hex string to ascii integer value

    //send payload
    for (let i = 0; i < payload_obj.len; i++) {
        send_data_via_uart(Buffer.from([parseInt(payload_obj.data[i], 16)])); //convert hex string to ascii integer value
    }

    //send payload length
    send_data_via_uart(Buffer.from([parseInt(decimalToHex(payload_obj.len), 16)])); //convert hex string to ascii integer value

    //send end sequence last
    for (let i = 0; i < SEQUENCE_LEN; i++) {
        send_data_via_uart(Buffer.from([parseInt(PACKET_END_SEQUENCE[i], 16)])); //convert hex string to ascii integer value
    }


    responseTimeoutId = setTimeout(handleTimeout, 10000);
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
