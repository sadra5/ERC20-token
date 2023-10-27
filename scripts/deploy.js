const hre = require("hardhat");

async function main() {

  //we get the contract to deploy
  const Token = await hre.ethers.getContractFactory("myToken");
  const token = await Token.deploy("SadraRez", "REZ", 20000, 100000, 100)

  // await token.deployed();
  // console.log(token.target)
  console.log("token deployed to", token.target);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  })