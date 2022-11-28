// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

//To determine voting power: the Governor module, which hooks to a IVotes instance to assess the voting power of an account 
// based on the token balance it holds when a proposal becomes active. 
//This module requires the address of the token as a constructor parameter.
import "@openzeppelin/contracts/governance/Governor.sol";
//To decide on the options voters have to select between: GovernorCountingSimple, 
// a module that offers 3 options to voters: For, Against, and Abstain, 
// where only For and Abstain votes are counted towards quorum.
import "@openzeppelin/contracts/governance/extensions/GovernorCountingSimple.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorVotes.sol";
//To find how many votes are needed for a quorum: the GovernorVotesQuorumFraction module which works together 
// with ERC20Votes to define quorum as a percentage of the total 
// supply at the block when a proposal's voting power is retrieved. 
//This requires a constructor parameter to set the percentage (4% is standard).
import "@openzeppelin/contracts/governance/extensions/GovernorVotesQuorumFraction.sol";

contract YSFGovernor is Governor, GovernorCountingSimple, GovernorVotes, GovernorVotesQuorumFraction {
    constructor(IVotes _token)
        Governor("YSFGovernor")
        GovernorVotes(_token)
        GovernorVotesQuorumFraction(4)
    {}

    //Determines how long after a proposal is created should voting power be fixed.
    //A large voting delay gives users time to unstake tokens if necessary
    function votingDelay() public pure override returns (uint256) {
        return 6545; // 1 day = 6545 blocks
    }

    //Determines how long a proposal remains open to votes
    function votingPeriod() public pure override returns (uint256) {
        return 45818; // 1 week = 45818 blocks
    }

    //This restricts proposal creation to accounts that have enough voting power.
    function proposalThreshold() public pure override returns (uint256) {
        return 0;
    }

    // The following functions are overrides required by Solidity.

    function quorum(uint256 blockNumber)
        public
        view
        override(IGovernor, GovernorVotesQuorumFraction)
        returns (uint256)
    {
        return super.quorum(blockNumber);
    }
}