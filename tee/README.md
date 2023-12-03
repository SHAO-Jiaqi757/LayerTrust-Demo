# LayerTrust Occlum Oracle Demo

## How it works
1. Query top swaps data from Uniswap Subgraph
2. Submit VIP address to Solidity contract in Occlum TEE

## Query Uniswap Subgraph
`theGraphData.json`: data comes from Uniswap Subgraph playground https://thegraph.com/explorer/subgraphs/HUZDsRpEVP2AvzDCyzDHtdc64dyDxx8FQjzsmqSg4H3B?view=Playground&chain=arbitrum-one

Query the top swaps ordered by amount in USD
```graphql
{
  swaps(first: 100, orderBy: amountUSD, orderDirection: desc) {
    amountUSD
    id
    origin
    sender
    timestamp
    recipient
  }
}
```

## How to Run

This tutorial is written under the assumption that you have Docker installed and use Occlum in a Docker container.

Occlum is compatible with glibc-supported Python, we employ miniconda as python installation tool. You can import PyTorch packages using conda. Here, miniconda is automatically installed by `install_python_with_conda.sh` script, the required python packages for this project are also loaded by this script.

Step 0 (on the host): Clone this repo to `/opt/occlum-demo/web3` and set `.env`

Step 1 (on the host): Start an Occlum container
```
docker run -it --privileged -v /dev/sgx:/dev/sgx -v /opt/occlum-demo:/opt/occlum-demo occlum/occlum:latest-ubuntu20.04
```

Step 2 (in the Occlum container): Download miniconda and install python to prefix position.
```
cd /opt/occlum-demo/web3
bash ./install_python_with_conda.sh
```

Step 3 (in the Occlum container): Run the sample code on Occlum
```
cd /opt/occlum-demo/web3
bash ./run_python_on_occlum.sh
```


