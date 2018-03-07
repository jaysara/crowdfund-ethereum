import Web3 from 'web3';

let web3;
if(typeof window != 'undefined' && window.web3 != 'undefined')
{
  // We are in web browser and metamask is running
  web3 = new Web3(window.web3.currentProvider);
} else{
  // we are  on the server or user is not running the metamask
  const provider = new Web3.providers.HttpProvider(
    'https://rinkeby.infura.io/vyVt4ISM7XCZpXOZj7C2'
  );
  web3 = new Web3(provider);
}
export default web3;
