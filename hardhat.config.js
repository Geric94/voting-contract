/**
* @type import('hardhat/config').HardhatUserConfig
*/

require('dotenv').config();
require("@nomiclabs/hardhat-ethers");

const { API_GOERLI_URL, PRIVATE_GOERLI_KEY } = process.env;
const { API_MUMBAI_URL, PRIVATE_MUMBAI_KEY } = process.env;
module.exports = {
  solidity: {
    version: "0.8.17", 
    optimizer: {
      enabled: true,
      runs: 200,
    },
  }, 
   defaultNetwork: "mumbai",
   networks: {
      hardhat: {},
      goerli: {
         url: API_GOERLI_URL,
         accounts: [`0x${PRIVATE_GOERLI_KEY}`]
      },
      mumbai: {
        url: API_MUMBAI_URL,
        accounts: [`0x${PRIVATE_MUMBAI_KEY}`]
     },
  },
}