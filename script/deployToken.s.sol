// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {Token} from "src/Token.sol";
//import {Evaluator} from "src/Evaluator.sol";

contract CounterScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        //vm.startBroadcast(vm.envUint("anvil"));
        Token erc20 = new Token("GRJJG", "GRJJG", 72111023000000000000000000);
        //Evaluator evaluator = new Evaluator(erc20);
        //erc20.setTeacher(address(evaluator), true);
        vm.stopBroadcast();
    }
}