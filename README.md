# Lesson 3. Star Notary V2

For this you will need to use the latest version of Truffle and Metamask

- Truffle : Truffle v5.0.21
- Metamask : 6.5.3
- OpenZeppelin : 

If you need to update truffle to the latest version use:
`npm install -g truffle`

If you need to update Metamask just delete your Metamask extension and install it again.

## Info token 

- Type : ERC-721
- Name : AZET StartNotary Token
- Symbol : AZT

## Déployment

- Network : Rinkeby
- Address : 0xEa505Fb8a225db5197369530bb6FFBd0D72a7Fc1
- URL : https://rinkeby.etherscan.io/address/0xea505fb8a225db5197369530bb6ffbd0d72a7fc1

## Setup project for Review.

To setup the project for review do the following:
1. Download the project : `git clone https://github.com/eudeskpondjo/starNotaryv2.git`
2. Go to the project directory : `cd starNotaryv2`
3. Run command `npm install` to install the project dependencies.

### Run the unit tests
1. Configure you Metamask to connect to your local network
2. Run command `truffle develop` to inter developpement mode.
3. Run command `compile` to compile the contract.
4. Run command `migrate --reset` to clean.
4. Run command `test` to run the unit tests.

### Run the DApp to interact with the Rinkeby network

1. Configure you Metamask to connect to your Rinkeby network
2. Go to App directory : `cd app`
3. Run command `npm install` to install the project dependencies.
4. Run command `npm run dev` to compile and run the DApp.
4. Using your browser, connect to http://localhost:8080/.