from web3 import Web3
from dotenv import load_dotenv
import os
import json

load_dotenv()

# Initialize endpoint URL
node_url = os.getenv("rpc")

# Create the node connection
web3 = Web3(Web3.HTTPProvider(node_url))
# Verify if the connection is successful
if web3.is_connected():
    print("-" * 50)
    print("Connection Successful")
    print("-" * 50)
else:
    print("Connection Failed")

# Initialize the address calling the functions/signing transactions
caller = os.getenv("walletAddress")
private_key = os.getenv("privateKey")

# Initialize address nonce
nonce = web3.eth.get_transaction_count(caller)

# Initialize contract ABI and address
with open("./UniswapVIP.abi.json") as f:
    abi = json.load(f)

contract_address = os.getenv("contractAddress")

# Create smart contract instance
contract = web3.eth.contract(address=contract_address, abi=abi)

print(f"Adding new VIPs...")
# Read the Graph data from json
with open("theGraphData.json") as f:
    swaps = json.load(f)["data"]["swaps"]
vips = []
for swap in swaps:
    sender = web3.to_checksum_address(swap["sender"])
    vips.append(sender)
print(vips, "\n")
print(f"Is {vips[-1]} in VIPs? {contract.caller().isVIP(vips[-1])}\n")

# Call your function
call_function = contract.functions.setVIPs(vips).build_transaction(
    {"from": caller, "nonce": nonce}
)

# Sign transaction
signed_tx = web3.eth.account.sign_transaction(call_function, private_key=private_key)

# Send transaction
send_tx = web3.eth.send_raw_transaction(signed_tx.rawTransaction)

# Wait for transaction receipt
tx_receipt = web3.eth.wait_for_transaction_receipt(send_tx)
print(tx_receipt)  # Optional
print(f"Is {vips[-1]} in VIPs? {contract.caller().isVIP(vips[-1])}\n")