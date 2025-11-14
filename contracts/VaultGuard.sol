// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


contract VaultGuard {
struct Grant {
address grantee;
uint256 expiresAt;
string dataCid;
}


mapping(address => Grant[]) public grants;


event GrantAdded(address indexed owner, address indexed grantee, uint256 expiresAt, string dataCid);
event GrantRevoked(address indexed owner, address indexed grantee, string dataCid);


function addGrant(address grantee, uint256 expiresAt, string calldata dataCid) external {
grants[msg.sender].push(Grant(grantee, expiresAt, dataCid));
emit GrantAdded(msg.sender, grantee, expiresAt, dataCid);
}


function revokeGrant(address grantee, string calldata dataCid) external {
Grant[] storage list = grants[msg.sender];
for (uint i = 0; i < list.length; i++) {
if (list[i].grantee == grantee) {
list[i] = list[list.length - 1];
list.pop();
emit GrantRevoked(msg.sender, grantee, dataCid);
return;
}
}
revert("Grant not found");
}


function getGrants(address owner) external view returns (Grant[] memory) {
return grants[owner];
}
}