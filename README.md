# Bittorrent Chain Solidity Training

BTTC solidity training inspired by [Patrick Collins's Solidity & Blockchain trainings](https://youtu.be/umepbfKp5rI?si=5ersakMOiJ-XFeyY) and adapted to Bittorrent Chain.
Brought to you by SimbadMarino

**1)  Fund Me smart contract using Remix IDE:**

Easiest way to start writing your smartcontracts on BTTC is by coding in [Remix](https://remix.ethereum.org/) and directly inject your account from Metamask. You can follow  Patrick's training, the only difference compared to ETH is solidity version, recommended as of February 2024 is to use version 0.8.19 due to imcompatibility issues with EIP-1559 with solidity versions above 0.8.19.

Additional to this we cannot use Link oracle for  BTTC, the only available oracle for BTTC as of Feb 2024 is Band. The PriceConverter.sol library included in this repository uses Band to get BTT/USD price. Beyond solidity version and compatible oracles you can still follow Patricks course without problems :) 

Needed Files:

- FundMe.sol
- PriceConverter.sol
- Band.sol

FundMe contract allows us to:

- Get funding from users.
- Withdraw only to contract creator.
- Stores funders vs address list.
- Uses Band protocol smartcontract to get latest BTT price and get minimum amount of BTT to be funded.

Special thanks to: @Sirluke79 for the Band solity aid :)

If you decide to use the code feel free to use it. However there is no guarantee the code is free of bugs neither it has gone trough a security audit. Use at your own risk.

**2) Foundry Solidity Setup for BTTC**

For details about installing and configuring your developer bench please follow [Patrick Collins's Foundry tutorial](https://www.youtube.com/watch?v=umepbfKp5rI&t=22978s). Instructions below summarizes the needed steps to deploy your contracts to BTTC instead of using Anvil local ETH test node.

Steps:

1) Go to https://getfoundry.sh
2) Copy and paste the curl command from the website and run it in your terminal
3) If missing developer dependencies please install them and run again until it is succesfully installed.
4) Initialize a new Foundry Solidity project by running : `forge init your_new_project`
5) Write your solidity code
6) Compile your code with `forge compile`
7) Deploy your contract to BTTC by running: `forge create --legacy SimpleStorage --rpc-url https://rpc.bt.io/ --interactive` (the interactive flag will ask your for your mainnet private key, if your want to deploy to testnet use the `https://pre-rpc.bt.io/`rpc instead)
8) Et voila :). Enjoy!
