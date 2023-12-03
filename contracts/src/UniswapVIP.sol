// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract UniswapVIP {
    mapping(address => bool) public isVIP;

    function setVIPs(address[] calldata _VIPs) public {
        for (uint i = 0; i < _VIPs.length; i++) {
            isVIP[_VIPs[i]] = true;
        }
    }

    function isAddrVIP(address _addr) public view returns (bool) {
        return isVIP[_addr];
    }
}
