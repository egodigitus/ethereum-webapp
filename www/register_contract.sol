pragma solidity ^0.4.0;

/**@title copyright registration contract
 * @author Dominik Lauck
 */

// register contract
contract RegisterContract {
  
  // contract owner
  address contractOwner;
  mapping (address => bytes32) objectRegister;
  
  // event for string and address outputs.
  event EventOutputMessage(string _message, address _address);
  
  /**@dev check if the message sender is the owner of the charge
   */
  modifier isOwner() {
    if (msg.sender != contractOwner)
      revert();
    else
      _;
  }
  
  /**@dev initialize owner
   */
  function RegisterContract() {
    contractOwner = msg.sender;
  }
  
  /**@dev register a new object
   */
  function registerObject(bytes32 _hash) {
    objectRegister[msg.sender] = _hash;
    
    EventOutputMessage("An object was registered for address:", msg.sender);
  }
  
  /**@dev returns the hash registered by the user
   */
  function checkRegistry(address user) returns (bytes32 _hash){
    return (objectRegister[user]);
  }
  
  // DEBUG
  /**@dev kill function, only executable by contract owner
   */
  function kill() isOwner {
    EventOutputMessage("Contract gets killed now.", address(this));
    selfdestruct(contractOwner);
  }
}
