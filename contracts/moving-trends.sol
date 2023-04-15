// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract MovingTrends {
    struct Campaign {
        address owner;
        string title;
        string desc;
        uint256 target;
        uint256 deadline;
        uint256 amountCollected;
        string image;
        address[] donators;
        uint256[] donations;
    }
}
