pragma solidity ^0.8.4;

contract SubOverflow {
    // Modify this function so that on overflow it returns the value 0
    // otherwise it should return x - y
    function subtract(uint256 x, uint256 y) public pure returns (uint256) {
        // Write assembly code that handles overflows
        assembly {
            // Check if x is less than y to prevent underflow
            if lt(x, y) {
                // Return 0 from EVM zero slot
                return(0x60, 32)
            }

            // Subtract y from x
            let result := sub(x, y)

            // Store data in first available location in EVM free memory
            mstore(0x80, result)

            // Return 32 bytes (256 bits) from memory
            return(0x80, 32)
        }
    }
}