/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: {
    version: '0.8.9',
    // added by me
    defaultNetwork: 'sepolia',
    networks: {
      hardhat: {},
      sepolia: {
        url: 'https://rpc.sepolia.dev',
        accounts: [`0x${process.env.PRIVATE_KEY}`],
      },
    },
    // end
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
};
