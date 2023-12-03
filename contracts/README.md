## Foundry
0xC6f6bF5305eB0f9a67C72E7DF8f093d8dc4A8402

https://goerli.etherscan.io/address/0xc6f6bf5305eb0f9a67c72e7df8f093d8dc4a8402

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy
Create `.env`:
```
privateKey = ''
rpc = ''
```

```shell
source .env
forge create --rpc-url $rpc --private-key $privateKey src/UniswapVIP.sol:UniswapVIP
# forge script script/UniswapVIP.s.sol:UniswapVIPScript --rpc-url $rpc --private-key $privateKey
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
