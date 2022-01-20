// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "./QueueLibrary.sol";

/**
 * @title AddressQueue
 * @author Erick Dagenais (https://github.com/edag94)
 * @dev Address implementation of the queue library
 */
abstract contract AddressQueue { 
    // AddressQueue

    struct Address_Queue {
        QueueLibrary.QueueStorage _inner;
    }

    /**
     * @dev Sets the queue's initial state, with a queue size of 0.
     * @param queue Address_Queue struct from contract.
     */
    function initialize(Address_Queue storage queue) internal {
        QueueLibrary.initialize(queue._inner);
    }

    /**
     * @dev Gets the number of elements in the queue. O(1)
     * @param queue Address_Queue struct from contract.
     */
    function length(Address_Queue storage queue) internal view returns (uint256) {
        return QueueLibrary._length(queue._inner);
    }

    /**
     * @dev Returns if queue is empty. O(1)
     * @param queue Address_Queue struct from contract.
     */
    function isEmpty(Address_Queue storage queue) internal view returns (bool) {
        return QueueLibrary._isEmpty(queue._inner);
    }

    /**
     * @dev Adds an element to the back of the queue. O(1)
     * @param queue Address_Queue struct from contract.
     * @param data The added element's data.
     */
    function enqueue(Address_Queue storage queue, address data) internal {
        QueueLibrary._enqueue(queue._inner, bytes32(uint256(uint160(data))));
    }

    /**
     * @dev Removes an element from the front of the queue and returns it. O(1)
     * @param queue Address_Queue struct from contract.
     */
    function dequeue(Address_Queue storage queue) internal returns (address data) {
        return address(uint160(uint256(QueueLibrary._dequeue(queue._inner))));
    }

    /**
     * @dev Returns the data from the front of the queue, without removing it. O(1)
     * @param queue Address_Queue struct from contract.
     */
    function peek(Address_Queue storage queue) internal view returns (address data) {
        return address(uint160(uint256(QueueLibrary._peek(queue._inner))));
    }

    /**
     * @dev Returns the data from the back of the queue. O(1)
     * @param queue Address_Queue struct from contract.
     */
    function peekLast(Address_Queue storage queue) internal view returns (address data) {
        return address(uint160(uint256(QueueLibrary._peekLast(queue._inner))));
    }
}