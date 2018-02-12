# crowdfund-ethereum
Demonstrates how ethereum contracts can be used to create and manage crowd funding campaigns

Make sure you are using the latest version of node. This program is compiled, built and tested using node version 9.4.
Change your node version to 9 by typing ```script node use 9 ```
Type ```script node --version ``` to make sure you are using the right version.

Start by cloning this diectory in your workspace.
Go to the directory and type,
npm install --save ganache-cli mocha solc fs-extra web3@1.0.0-beta.26

### Compile Contract
Make sure you compile the ehtereum contract by typing
```script
node compile.js
```
### Run Test
Ethereum makes it very easy to run the test. __ganache-clie__ library makes it easy to simulate the rinkby test network with in you program before running. The project file contains 6 test cases that make sure that contract is valid for some basic funtions like, creating contract, sending contribution, request for the spend, approving spend request and finalizing the request. Run all the test my typing following.

```script
npm run test
```

To deploy a contract you need to install truffle-hdwallet-provider.
```script
npm install --save truffle-hdwallet-provider
```
### Deploy Contract
Deploying contract in to Rinkby Network
```script
node deploy.js
```
Note the address where contract is deployed. The 'ADDRESS' file in this project
