pragma solidity ^0.4.18;

import "browser/safemath.sol";

contract MomeroScam {

     using SafeMath for uint;
    
    uint public totalSuply;
    
    function set() public {
        totalSuply = 2;
    }
    function minus() public {
        totalSuply = totalSuply.sub(1);
    }
        
}