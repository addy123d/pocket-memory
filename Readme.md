### POCKET VAULT

Pocket Vault, a project I was working on for some time. We all know the importance of keeping credentials safe, whether they're online account passwords, API keys, or other sensitive information. I've tried numerous password managers to safeguard my credentials, but a common problem persists: security breaches are all too common in today's digital landscape. These managers run on computers alongside other programs, some of which could be malicious, posing a significant security risk.

To address this issue, I came up with the idea of putting the password manager on dedicated hardware. I call it 'Pocket Vault'—a small, dedicated gadget designed specifically to keep credentials safe. While it's a plug-and-play device, operating it hasn't been the most user-friendly experience. However, I've designed the firmware to provide APIs through which anyone can perform operations.

Where do I store all the data? On EEPROM. And is it encrypted? Absolutely. I've implemented AES encryption to secure all the data stored on the device.

One major limitation of this project is EEPROM endurance. Despite this challenge, developing Pocket Vault has been well worth it—it performs as expected and provides peace of mind knowing that my credentials are secure.
