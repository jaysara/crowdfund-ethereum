pragma solidity ^0.4.19;

contract CampaignFactory{

    address[] public deployedCompaign;

    function createCompaign(uint minimum) public{
        address newCampaing = new Campaign(minimum,msg.sender);
        deployedCompaign.push(newCampaing);
    }

    function getDeployedCampaign() public view returns (address[]){
        return deployedCompaign;
    }

}

contract Campaign{

    struct Request{
        string description;
        uint value;
        address recipient;
        bool complete;
        uint approvalCount;
        mapping (address => bool) approvals;
    }

    Request[] public requests;

    address public manager;
    uint public minimumContribution;
    uint public approversCount;

    mapping(address=>bool) public approvers;

    modifier restricted(){
        require (msg.sender == manager);
        _;
    }

    function Campaign(uint minimum,address creator) public {
        manager = creator;
        minimumContribution = minimum;


    }

    function contribute() public payable{
        require (msg.value > minimumContribution);

        approvers[msg.sender]=true;
        approversCount++;
    }

    function createRequest(string description,uint value, address recipient) public restricted {
        Request memory newRequest = Request({
            description:description,
            value:value,
            recipient:recipient,
            complete:false,
            approvalCount:0
        });

        requests.push(newRequest);
    }

    function approveRequest(uint index) public {
        Request storage request = requests[index];

        require(approvers[msg.sender]);
        require(!request.approvals[msg.sender]);
        request.approvalCount++;


    }

    function finalizeRequest(uint index) public restricted{

        Request storage request = requests[index];

        require(!request.complete);

        require(request.approvalCount > approversCount / 2);
        request.recipient.transfer(request.value);

        request.complete = true;


    }

    function getSummary() public view returns (uint,uint,uint, uint, address){
        return (
          minimumContribution,
          this.balance,
          requests.length,
          approversCount,
          manager
          );
    }

    function getRequestCount() public view returns (uint) {
        return requests.length;
    }

}
