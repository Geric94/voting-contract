async function main() {
    // Grab the contract factory 
    const MyYSFGovernor = await ethers.getContractFactory("YSFGovernor");
 
    // Start deployment, returning a promise that resolves to a contract object
    // Instance of the contract taking token contract address as input
    // TOKEN_CONTRACT_ADDRESS = 0x198633C2304C5b4CCf8e682438cDcb8D787369A9 -> .env ?
    const myYSFGovernor = await MyYSFGovernor.deploy("0x58C08eBE942C0a58C2Ce9603aafdEF1691b202CB");
    console.log("YSF Governor contract deployed to address:", myYSFGovernor.address);
}
 
main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
});