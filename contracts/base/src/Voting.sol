// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SkillBadge {
    struct Badge {
        uint256 id;
        address recipient;
        string skill;
        string metadata;
        uint256 issuedAt;
        bool soulbound;
    }

    mapping(uint256 => Badge) public badges;
    mapping(address => uint256[]) public userBadges;
    uint256 public badgeCount;

    event BadgeMinted(uint256 indexed badgeId, address indexed recipient, string skill);

    error Soulbound();
    error NotOwner();

    function mintBadge(
        address _recipient,
        string memory _skill,
        string memory _metadata
    ) external returns (uint256) {
        uint256 badgeId = badgeCount++;

        badges[badgeId] = Badge({
            id: badgeId,
            recipient: _recipient,
            skill: _skill,
            metadata: _metadata,
            issuedAt: block.timestamp,
            soulbound: true
        });

        userBadges[_recipient].push(badgeId);

        emit BadgeMinted(badgeId, _recipient, _skill);

        return badgeId;
    }

    function getBadge(uint256 _badgeId) external view returns (Badge memory) {
        return badges[_badgeId];
    }

    function getUserBadges(address _user) external view returns (uint256[] memory) {
        return userBadges[_user];
    }
}
