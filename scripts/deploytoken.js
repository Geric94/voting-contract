async function main() {
    // Grab the contract factory 
    const MyYSFToken = await ethers.getContractFactory("YSFToken");
  
    // Start deployment, returning a promise that resolves to a contract object
    const myYSFToken = await MyYSFToken.deploy(); // Instance of the contract 
    console.log("YSF token contract deployed to address:", myYSFToken.address);
  }
  
main()
.then(() => process.exit(0))
.catch(error => {
    console.error(error);
    process.exit(1);
});