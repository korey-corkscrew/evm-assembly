pragma solidity ^0.8.4;

contract Intro {
    function intro() public pure returns (uint16) {
        uint256 mol = 420;

        // Yul assembly magic happens within assembly{} section
        assembly {
            // stack variables are instantiated with
            let variable_name := mol
            
            // Store data at first EVM free memory location 0x80
            mstore(0x80, variable_name)

            // Return data from memory
            return(0x80, 32)
        }
    }
}