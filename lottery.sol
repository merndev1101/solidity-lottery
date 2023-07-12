//SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;  

contract lottery{

    address public deployerAddress = msg.sender ;
    
    uint randomNumber ;
  
        // deployerAddress ;
    

    address payable[]  addressOfBuyer;

        

    receive() external payable{
        
        require( msg.value == 2000000000000000000,"sorry yor transaction value is not equal to 2");
    
        addressOfBuyer.push(payable(msg.sender));

}

function totalUser() public view returns(uint){
            return addressOfBuyer.length;
        }


function totalBalance() public  view returns(uint){

    return address(this).balance;

}


function findWinner( ) public returns(bool){


require( msg.sender == deployerAddress , "you are not owner"); //718623

   

        if(addressOfBuyer.length>1){
            
            

            randomNumber =  uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,addressOfBuyer.length))) % addressOfBuyer.length;

         address payable winner;

         winner = addressOfBuyer[randomNumber];
         winner.transfer(totalBalance());
      
        return true;
          


        

        }
        else{
            // return "insufficient person";
        }


}


// function payWinner() public payable{
//     getter.transfer( address(this).balance);
// }

function changeOwner(address _newOwner) public returns(address){

    require(msg.sender == deployerAddress);

    deployerAddress = _newOwner;

    return deployerAddress ;

}

function removeAllUser() public {

    require(msg.sender == deployerAddress , "SORRY you are not owner");
    require(findWinner()==true , "owner , please run the find winner ");

    while(addressOfBuyer.length > 0) {
    addressOfBuyer.pop();
    
    
    }

    

}


}
