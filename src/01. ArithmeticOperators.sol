// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract Addition {
    uint256 number = 1;

    function addition(uint256 value) public {
        number += value;
    }
}
contract AdditionOptimized {
    uint256 number = 1;

    function addition(uint256 value) public {
        assembly {
            sstore(number.slot, add(sload(number.slot), value))
        }
    }

    function additionV2(uint256 value) public {
        assembly {
            sstore(number.slot, add(sload(number.slot), value))
        }
    }
}

contract Subtraction {
    uint256 number = 100;

    function subtraction(uint256 value) public {
        number -= value;
    }
}

contract SubtractionOptimized {
    uint256 number = 100;

    function subtraction(uint256 value) public {
        assembly {
            sstore(number.slot, sub(sload(number.slot), value))
        }
    }
}

contract Division {
    function divisionBy2(uint256 number) public pure returns (uint256) {
        return number / 2;
    }

    function divisionBy128(uint256 number) public pure returns (uint256) {
        return number / 128;
    }
}

contract DivisionOptimized {
    function divisionBy2(uint256 number) public pure returns (uint256) {
        uint256 num = number;
        assembly {
            mstore(0x80, shr(1, num))
            return(0x80, 0x20)
        }
    }

    function divisionBy128(uint256 number) public pure returns (uint256) {
        uint256 num = number;
        assembly {
            mstore(0x80, shr(7, num))
            return(0x80, 0x20)
        }
    }
}
