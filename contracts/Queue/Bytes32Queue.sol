// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "./QueueLibrary.sol";

/**
 * @title Bytes32Queue
 * @author Erick Dagenais (https://github.com/edag94)
 * @dev Bytes32 implementation of the queue library
 */
abstract contract Bytes32Queue { 

    struct Bytes32_Queue {
        QueueLibrary.QueueStorage _inner;
    }

    /**
     * @dev Sets the queue's initial state, with a queue size of 0.
     * @param queue Bytes32Queue struct from contract.
     */
    function initialize(Bytes32_Queue storage queue) internal {
        QueueLibrary.initialize(queue._inner);
    }

    /**
     * @dev Gets the number of elements in the queue. O(1)
     * @param queue Bytes32Queue struct from contract.
     */
    function length(Bytes32_Queue storage queue) internal view returns (uint256) {
        return QueueLibrary._length(queue._inner);
    }

    /**
     * @dev Returns if queue is empty. O(1)
     * @param queue Bytes32Queue struct from contract.
     */
    function isEmpty(Bytes32_Queue storage queue) internal view returns (bool) {
        return QueueLibrary._isEmpty(queue._inner);
    }

    /**
     * @dev Adds an element to the back of the queue. O(1)
     * @param queue Bytes32_Queue struct from contract.
     * @param data The added element's data.
     */
    function enqueue(Bytes32_Queue storage queue, bytes32 data) internal {
        QueueLibrary._enqueue(queue._inner, data);
    }

    /**
     * @dev Removes an element from the front of the queue and returns it. O(1)
     * @param queue Bytes32_Queue struct from contract.
     */
    function dequeue(Bytes32_Queue storage queue) internal returns (bytes32 data) {
        return QueueLibrary._dequeue(queue._inner);
    }

    /**
     * @dev Returns the data from the front of the queue, without removing it. O(1)
     * @param queue Bytes32_Queue struct from contract.
     */
    function peek(Bytes32_Queue storage queue) internal view returns (bytes32 data) {
        return QueueLibrary._peek(queue._inner);
    }

    /**
     * @dev Returns the data from the back of the queue. O(1)
     * @param queue Bytes32_Queue struct from contract.
     */
    function peekLast(Bytes32_Queue storage queue) internal view returns (bytes32 data) {
        return QueueLibrary._peekLast(queue._inner);
    }

}