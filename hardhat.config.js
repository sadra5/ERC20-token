require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.20",
  networks: {
    mumbai : {
      url: "https://rpc-mumbai.maticvigil.com",
      accounts: ["8f6b8c9dadc760fe80128a91dcd4dab18d296a133eebd1cbfe995a9b5cf705f8"]
    }
  }
};
