pragma solidity ^0.8.4;

contract Scope {
    uint256 public count = 10;

    function increment(uint256 num) public {
        // Modify state of the count variable from within
        // the assembly segment
        assembly {
            // Load 'count' from storage slot 0
            let data := sload(0)

            // Add 'num' to 'count' value
            let sum := add(data, num)

            // Store sum in 'count' storage slot 0
            sstore(0, sum)
        }
    }
}