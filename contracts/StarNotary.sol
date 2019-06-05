pragma solidity >=0.4.24;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";

contract StarNotary is ERC721 {

    // Implement Task 1 Add a name and symbol properties
    
    // name: Is a short name to your token
    string public constant name = "AZET StartNotary Token";

    // symbol: Is a short string like 'USD' -> 'American Dollar'
    string public constant symbol = "AZT";

    struct Star {
        string name;
    }

    mapping(uint256 => Star) public tokenIdToStarInfo;
    mapping(uint256 => uint256) public starsForSale;
    

    // Create Star using the Struct
    function createStar(string memory _name, uint256 _tokenId) public {
        Star memory newStar = Star(_name);
        tokenIdToStarInfo[_tokenId] = newStar;
        _mint(msg.sender, _tokenId);
    }

    // Putting an Star for sale (Adding the star tokenid into the mapping starsForSale, first verify that the sender is the owner)
    function putStarUpForSale(uint256 _tokenId, uint256 _price) public {
        require(ownerOf(_tokenId) == msg.sender, "You can't sale the Star you don't owned");
        starsForSale[_tokenId] = _price;
    }   

    function _make_payable(address x) internal pure returns (address payable) {
        return address(uint160(x));
    }

    function buyStar(uint256 _tokenId) public  payable {
        require(starsForSale[_tokenId] > 0, "The Star should be up for sale");
        uint256 starCost = starsForSale[_tokenId];
        address ownerAddress = ownerOf(_tokenId);
        require(msg.value > starCost, "You need to have enough Ether");
        _transferFrom(ownerAddress, msg.sender, _tokenId);
        address payable ownerAddressPayable = _make_payable(ownerAddress);
        ownerAddressPayable.transfer(starCost);
        if(msg.value > starCost) {
            msg.sender.transfer(msg.value - starCost);
        }
    }

    // Implement Task 1 lookUptokenIdToStarInfo
    function lookUptokenIdToStarInfo (uint _tokenId) public view returns (string memory) {
        //1. return star saved in tokenIdToStarInfo mapping
        Star memory savedStar = tokenIdToStarInfo[_tokenId];
        return savedStar.name;
    }

    // Implement Task 1 Exchange Stars function
    function exchangeStars(uint256 _tokenId1, uint256 _tokenId2) public {
        //1. Passing to star tokendId you will need to check if the owner of _tokenId1 or _tokenId2 is the sender
        require((ownerOf(_tokenId1) == msg.sender || ownerOf(_tokenId2) == msg.sender), "You can't exchange the Star you don't owned");

        //2. You don't have to check for the price of the token (star)

        //3. Get the owner of the two tokens (ownerOf(_tokenId1), ownerOf(_tokenId2))
        address owner1Address = ownerOf(_tokenId1);
        address owner2Address = ownerOf(_tokenId2);

        //4. Use _transferFrom function to exchange the tokens.
        _transferFrom(owner1Address, owner2Address, _tokenId1);
        _transferFrom(owner2Address, owner1Address, _tokenId2);
    }

    // Implement Task 1 Transfer Stars function
    function transferStar(address _to1, uint256 _tokenId) public {

        // 1. Check if the sender is the ownerOf(_tokenId)
        require(ownerOf(_tokenId) == msg.sender, "You can't transfer the Star you don't owned");

        //2. Use the transferFrom(from, to, tokenId) function to transfer the Star
        address ownerAddress = ownerOf(_tokenId);
        transferFrom(ownerAddress, _to1, _tokenId);
    }    
}