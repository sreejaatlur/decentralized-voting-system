# decentralized-voting-system

#### The utilization of Ethereum Blockchain in the Decentralized Voting System establishes a secure and transparent framework for executing elections. Harnessing the capabilities of Ethereum's blockchain technology, this system guarantees the immutability of voting records, allowing users to remotely cast their votes with anonymity and fraud prevention. Delve into this groundbreaking project to experience a reliable and decentralized approach to voting processes.

#### For a cool demo of this project watch this [YouTube video](https://www.youtube.com/watch?v=6s_BY-M3IGY&ab_channel=ManideepMeda).

## Features

- Implements JWT for robust voter authentication and authorization, enhancing security measures.
- Integrates the Ethereum blockchain to guarantee the integrity and transparency of voting records, creating an immutable and verifiable ledger.
- Eliminates the necessity for intermediaries, establishing a trustless voting system with enhanced reliability.
- Implements an administrative dashboard for candidate management, voting schedule configuration, and real-time result monitoring.
- Offers an user-friendly interface for voters, facilitating seamless casting of votes and accessing comprehensive information about candidates.

## Requirements

- Node.js (version – 18.14.0)
- Metamask
- Python (version – 3.9)
- FastAPI
- MySQL Database (port – 3306)

## Screenshots

![Login Page](https://github.com/sreejaatlur/Decentralized-Voting-System-Using-Ethereum-Blockchain/blob/main/public/loginss.png)

![Admin Page](https://github.com/sreejaatlur/Decentralized-Voting-System-Using-Ethereum-Blockchain/blob/main/public/adminss.png)

![Voter Page](https://github.com/sreejaatlur/Decentralized-Voting-System-Using-Ethereum-Blockchain/blob/main/public/indexss.png)

## Installation

1.  Open a terminal.

2.  Clone the repository by using the command

        git clone https://github.com/sreejatlur/Decentralized-Voting-System-Using-Ethereum-Blockchain.git

3.  Download and install [Ganache](https://trufflesuite.com/ganache/).

4.  Create a workspace in the truffle projects section and in a new terminal migrate the truffle contract to local blockchain.

             truffle migrate --reset

6.  Download [Metamask](https://metamask.io/download/) extension for the browser.

7.  Now create wallet (if you don't have one), then import accounts from ganache.

8.  Add network to the metamask. ( Network name - Localhost 7575, RPC URl - http://localhost:7545, Chain ID - 1337, Currency symbol - ETH)

9.  Open MySQL and create database named <b>voter_db</b>.

10.  In the database created, create new table with voter_id, role and password columns.

11. Install truffle globally

        npm install -g truffle

12. Go to the root directory of repo and install node modules

        npm install

13. Install python dependencies

        pip install fastapi mysql-connector-python pydantic python-dotenv uvicorn uvicorn[standard] PyJWT

## Usage

#### Note: Update the database credentials in the `./Database_API/.env` file.

1.  Open terminal at the project directory

2.  Open Ganache and it's <b>development</b> workspace.

3.  open terminal in project's root directory and run the command

         truffle console

    then compile the smart contracts with command

         compile

4.  Bundle app.js with browserify

        browserify ./src/js/app.js -o ./src/dist/app.bundle.js

5.  Start the node server server

        node index.js

6.  Navigate to `Database_API` folder in another terminal and start the server

        cd Database_API

You're all set! The Voting app should be up and running now at http://localhost:8080/.<br>
For more info about usage checkout [YouTube video](https://www.youtube.com/watch?v=6s_BY-M3IGY&ab_channel=ManideepMeda).
