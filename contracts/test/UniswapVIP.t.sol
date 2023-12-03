// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {UniswapVIP} from "../src/UniswapVIP.sol";

contract UniswapVIPTest is Test {
    UniswapVIP public uniswapvip;

    function setUp() public {
        uniswapvip = new UniswapVIP();
    }

    function testSetVIPs() public {
        address addr1 = 0xf2aEE11ebda31E4172fF6a8eF81f65C08ad0040e;
        address addr2 = 0x32EE6b22C6F3f8F37E14E8Cc0884B6b56992e563;
        address[] memory addrs = new address[](2);
        addrs[0] = addr1;
        addrs[1] = addr2;
        uniswapvip.setVIPs(addrs);
        require(uniswapvip.isVIP(addr1));
        require(uniswapvip.isVIP(addr2));
        address notvip = 0xf7F35FA7b6A63A73FAB6fa7D4BE8AF805ab3E431;
        require(uniswapvip.isVIP(notvip) == false);
    }
}
