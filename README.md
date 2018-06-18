# Crowdcoin Masternode Setup Guide (Ubuntu 16.04)
![Example-Logo](https://crowdcoin.site/img/logo-dark.png)

This guide will assist you in setting up a Crowdcoin Masternode on a Linux Server running Ubuntu 16.04.

This tutorial will guide you through the steps necessary to setup a Crowdcoin Masternode on a VPS server that is controlled via your remote wallet. This is the most secure way of configuring a masternode as the 1,000 CRC collateral resides in your local wallet and not within the remote masternode.

Your local wallet is not required to be kept open and you can store it as a cold wallet whilst still collecting masternode payments. Whilst there are other ways to setup masternodes, this is by far the most secure and is highly recommended.

***
### Table of contents
* **Requirements**
* **Part A**: Preparing the local wallet.
* **Part B**: Creating the VPS within [Vultr](https://www.vultr.com/?ref=7296974).
* **Part C**: Downloading and installing Bitvise.
* **Part D**: Connecting to the VPS and installing the MN script via Bitvise.
* **Part E**: Connecting & Starting the masternode.

***
### Requirements
1) **1,000 CRC.**
2) **A Vultr VPS running Linux Ubuntu 16.04.**
3) **A Windows local wallet.**
4) **An SSH client such as [Bitvise](https://dl.bitvise.com/BvSshClient-Inst.exe)** or **[Putty](https://putty.org)**

***
### Part A: Preparing the Local wallet

***Step 1: Download the Crowdcoin wallet*** 

Download the Crowdcoin wallet from our [Official website](https://crowdcoin.site) or [Github](https://github.com/crowdcoinChain/Crowdcoin/releases)

***Step 2: Start the Crowdcoin wallet*** 

Start the Crowdcoin wallet !

:exclamation: The default directory where your data and wallet.dat will be stored is `C:\Users\YOUR_USERNAME\AppData\Roaming\Crowdcoincore`

***Step 3: Create masternode public address*** 

Depending on the number of masternodes you will be running, you will want to create a unique receiving address for each. A receiving address can be created in the wallet by selecting `Receive` in the left side of the wallet. Select `New Address` and click on ***OK*** to create a new receiving address. Create a new address for each masternode that you intend to run.

***Step 4: Generate masternode genkey***

Each masternode has a unique masternode key. This key is generated by the local wallet, however it is placed in the remote nodes configuration file to identify the masternode as your own. The key does not allow any access to collateral or coins earned so it is not a security concern but best practice is to keep it private.

In the debug console type `masternode genkey` in order to generate a unique masternode key. 
Run this command multiple times if you are intending to run multiple masternodes. Record these details for later use. 

***Step 5: Transfer 1,000 CRC to each masternode public address***

To allow your remote masternode to start you need to send 1,000 CRC to each masternode address in your local wallet, as generated in ***Step 3*** that you intend to operate. The transaction needs to be exactly ***1,000 CRC***. When you make this transaction, ensure that you factor in fees. The windows wallet will show you the total amount being deposited so ensure this reads excacly ***1,000 CRC***. Just to reiterate, you need to send exactly ***1,000 CRC*** in a single transaction to each masternode address that you intend to operate.

***Step 6: Record the transaction and output ID*** 

The transaction and output ID from the deposit you made into your masternode public address will need to be added to the masternode configuration file later on. Fetching this information now will make things a bit easier when we reach that stage. To get the transaction and output ID, go to `Help -> Debug window -> Console`. In the debug console type `masternode outputs` and the transaction and output ID will be displayed. Record these details for later use.

***
### Part B: Creating the VPS within Vultr

***Step 1:*** 
* Register at [Vultr](https://www.vultr.com/?ref=7296974)

***Step 2:*** 
* After you have added funds to your account go [here](https://my.vultr.com/deploy/) to create your Server

***Step 3:*** 
* Choose a server location (preferably somewhere close to you)

![Example-Location](https://i.imgur.com/ozi7Bkr.png)

***Step 4:*** 
* Choose a server type: Ubuntu 16.04

![Example-OS](https://i.imgur.com/aSMqHUK.png)

***Step 5:*** 
* Choose a server size: $5/mo will be fine
 
![Example-OS](https://i.imgur.com/UoGoHcM.png)

***Step 6:***
* Set a Server Hostname & Label (name it whatever you want)

![Example-hostname](https://i.imgur.com/NtualgA.png)

***Step 7:***
* Click "Deploy now"

![Example-Deploy](https://i.imgur.com/4qpYuH0.png)
***


### Part C: Downloading and installing BitVise. 

***Step 1:***
* Download Bitvise [here](https://dl.bitvise.com/BvSshClient-Inst.exe)

***Step 2:***
* Select the correct installer depending on your operating system. Then follow the install instructions. 

***


### Part D: Connecting to the VPS & Installing the MN script via Bitvise.

***Step 1***
* Copy your VPS IP (you can find this by going to the server tab within Vultr and clicking on your server. 
![Example-Vultr](https://i.imgur.com/z41MiwY.png)

***Step 2***
* Open the bitvise application and fill in the "Hostname" box with the IP of your VPS.
![Example-PuttyInstaller](https://i.imgur.com/vkN1alC.png)

***Step 3***
* Copy the root password from the VULTR server page.
![Example-RootPass](https://i.imgur.com/JnXQXav.png)

***Step 4***
* Type "root" as the login/username.
![Example-Root](https://i.imgur.com/11GMkvA.png)

***Step 5*** 
* Paste the password into the Bitvise terminal by right clicking (it will not show the password so just press enter)
![Example-RootPassEnter](https://i.imgur.com/zVhOAKu.png)

***Step 6*** 
* Once you have clicked open it will open a security alert (click yes).  

***Step 7***
* Paste the code below into the Bitvise terminal to download the script.

`wget -q https://raw.githubusercontent.com/ronaldr1987/crowdcoin/master/crowdcoin_install.sh`

***Step 8***
* Paste the code below into the Bitvise terminal then press enter to start the installation.

`bash crowdcoin_install.sh`

***Step 9***
* Sit back and wait for the install (this will take 10-20 mins)

***Step 10***
* When prompted enter your masternode genkey and press enter

***Step 11***
* You will now see all of the relavant information for your server.
* Keep this terminal open as we will need the info for the wallet setup.
***

### Part E: Connecting & Starting the masternode 

***Step 1***
* Go to the tools tab within the wallet and click open "masternode configuration file" 
***

***Step 2***

* Fill in the form. 
* For `Alias` type something like "MN01" **don't use spaces**
* The `Address` is the IP and port of your server.
* The `PrivKey` is your masternode genkey.
* The `TxHash` is the transaction ID/long key that you copied to the text file.
* The `Output Index` is the 0 or 1 that you copied to your text file.

Click "File Save"
***

***Step 3***
* Close out of the wallet and reopen Wallet
*Click on the Masternodes tab "My masternodes"
* Click start alias or start all in the masternodes tab
***

***step 4***
* Check the status of your masternode within the VPS by using the command below:

`crowdcoin-cli masternode status`

*You should see ***status 9*** 
