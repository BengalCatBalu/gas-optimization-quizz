// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract ArrayType {
    uint256[] array;

    function initArray() public {
        for (uint256 i; i < 200; ++i) {
            array.push(i);
        }
    }
}

contract ArrayTypeOptimized {
    mapping(uint256 => uint256) array; // we can skip length check because of mapping

    function initArray() public {
        for (uint256 i; i < 200;) {
            array[i] = i;
            unchecked {
                ++i;
            }
        }
    }

    function getAtIndex(uint256 i) public view returns (uint256) {
        return array[i];
    }
}
