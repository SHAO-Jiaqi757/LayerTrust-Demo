# LayerTrust Oracle Demo
Uniswap VIP Oracle contract live on: https://goerli.etherscan.io/address/0xc6f6bf5305eb0f9a67c72e7df8f093d8dc4a8402

Any dApps can query `isAddrVIP(address _addr)` function to determine whether an address is Uniswap VIP.


## How it works
Inside LayerTrust TEE:
1. Fetch top swaps from Uniswap Subgraph
2. Process data and submit to smart contract on ETH Goerli

## FOR DEMO ONLY
Currently, no origin checks in smart contract, so anyone can submit VIP address.