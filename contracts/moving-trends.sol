// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract MovingTrends {
    //
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
    mapping(uint256 => Campaign) public campaigns;

    uint256 public numberOfCampaigns = 0;

    // create campaigns

    function createCampaign(
        address _owner,
        string memory _title,
        string memory _desc,
        uint256 _target,
        uint256 _deadline,
        string memory _image
    ) public returns (uint256) {
        Campaign storage campaign = campaigns[numberOfCampaigns];
        // creating a campaign of type Campaign and storing on blockchain

        require(
            campaign.deadline < block.timestamp,
            "deadline should be in the future"
        );
        // filling our campaign
        campaign.owner = _owner;
        campaign.title = _title;
        campaign.desc = _desc;
        campaign.target = _target;
        campaign.deadline = _deadline;
        campaign.image = _image;
        numberOfCampaigns++;
        return numberOfCampaigns - 1;
    }

    // view function doesn't modify the state but just returns some values
    function getDonators(
        uint256 _id
    ) public view returns (address[] memory, uint256[] memory) {
        return (campaigns[_id].donators, campaigns[_id].donations);
    }

    function getCampaigns() public view returns (Campaign[] memory) {
        Campaign[] memory allCampaign = new Campaign[](numberOfCampaigns);
        for (uint256 idx = 0; idx < numberOfCampaigns; idx++) {
            Campaign storage item = campaigns[idx];
            allCampaign[idx] = item;
        }
        return allCampaign;
    }

    function donateToCampaign(uint256 _id) public payable {
        uint256 amount = msg.value;
        Campaign storage campaign = campaigns[_id];
        campaign.donators.push(msg.sender);
        campaign.donations.push(amount);

        // check the transaction
        (bool sent, ) = payable(campaign.owner).call{value: amount}("");
        if (sent) {
            campaign.amountCollected = campaign.amountCollected + amount;
        }
    }
}
