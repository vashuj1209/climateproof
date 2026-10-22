// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
/// @notice Prototype registry; not yet deployed or connected to the dashboard.
/// A commitment proves publication by an address, not sensor correctness.
contract ClimateProofRegistry {
    mapping(address => mapping(bytes32 => uint256)) public recordedAt;
    event Recorded(address indexed submitter, bytes32 indexed digest, uint256 timestamp);
    function record(bytes32 digest) external {
        require(digest != bytes32(0), "Empty digest");
        require(recordedAt[msg.sender][digest] == 0, "Already recorded");
        recordedAt[msg.sender][digest] = block.timestamp;
        emit Recorded(msg.sender, digest, block.timestamp);
    }
}
