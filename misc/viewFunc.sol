// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

  
// Defining a contract
contract Test {
      
    // Declaring state 
    // variables
    uint num1 = 2; 
    uint num2 = 4;
    uint256 num3;
   // Defining view function to  
   // calculate product and sum 
   // of 2 numbers
   function getResult() public pure returns(uint product, uint sum){
       uint num1 = 10;
       uint num2 = 16;
       product = num1 * num2;
       sum = num1 + num2; 
       return (product, sum);
   }

   function getNum() public view returns (uint) {
       return num1;
   }
}
