// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "./QueueLibrary.sol";

/**
 * @title UIntQueue
 * @author Erick Dagenais (https://github.com/edag94)
 * @dev UIntQueue implementation of the queue library
 */
abstract contract UIntQueue {
    struct UInt_Queue {
        QueueLibrary.QueueStorage _inner;
    }

    /**
     * @dev Sets the queue's initial state, with a queue size of 0.
     * @param queue UInt_Queue struct from contract.
     */
    function initialize(UInt_Queue storage queue) internal {
        QueueLibrary.initialize(queue._inner);
    }

    /**
     * @dev Gets the number of elements in the queue. O(1)
     * @param queue UInt_Queue struct from contract.
     */
    function length(UInt_Queue storage queue) internal view returns (uint256) {
        return QueueLibrary._length(queue._inner);
    }

    /**
     * @dev Returns if queue is empty. O(1)
     * @param queue UInt_Queue struct from contract.
     */
    function isEmpty(UInt_Queue storage queue) internal view returns (bool) {
        return QueueLibrary._isEmpty(queue._inner);
    }

    /**
     * @dev Adds an element to the back of the queue. O(1)
     * @param queue UInt_Queue struct from contract.
     * @param data The added element's data.
     */
    function enqueue(UInt_Queue storage queue, uint256 data) internal {
        QueueLibrary._enqueue(queue._inner, bytes32(data));
    }

    /**
     * @dev Removes an element from the front of the queue and returns it. O(1)
     * @param queue UInt_Queue struct from contract.
     */
    function dequeue(UInt_Queue storage queue) internal returns (uint256 data) {
        return uint256(QueueLibrary._dequeue(queue._inner));
    }

    /**
     * @dev Returns the data from the front of the queue, without removing it. O(1)
     * @param queue UInt_Queue struct from contract.
     */
    function peek(UInt_Queue storage queue) internal view returns (uint256 data) {
        return uint256(QueueLibrary._peek(queue._inner));
    }

    /**
     * @dev Returns the data from the back of the queue. O(1)
     * @param queue UInt_Queue struct from contract.
     */
    function peekLast(UInt_Queue storage queue) internal view returns (uint256 data) {
        return uint256(QueueLibrary._peekLast(queue._inner));
    }
}