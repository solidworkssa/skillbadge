// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title SkillBadge Contract
/// @notice NFT-based skill certification and verification system.
contract SkillBadge {

    struct Badge {
        address recipient;
        string skill;
        uint256 timestamp;
        address issuer;
    }
    
    uint256 public nextTokenId;
    mapping(uint256 => Badge) public badges;
    
    event BadgeIssued(uint256 indexed tokenId, address indexed recipient, string skill);
    
    function issueBadge(address _recipient, string memory _skill) external {
        uint256 tokenId = nextTokenId++;
        badges[tokenId] = Badge({
            recipient: _recipient,
            skill: _skill,
            timestamp: block.timestamp,
            issuer: msg.sender
        });
        emit BadgeIssued(tokenId, _recipient, _skill);
    }
    
    function getBadge(uint256 _tokenId) external view returns (Badge memory) {
        return badges[_tokenId];
    }

}
