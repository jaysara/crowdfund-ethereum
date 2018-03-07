import web3 from './web3';
import CampaignFactory from './build/CampaignFactory.json';

const instance = new web3.eth.Contract(
  JSON.parse(CampaignFactory.interface)
  ,'0x6860d7d0c295983eE847D5c362A9917671EAA9d1');

export default instance;
