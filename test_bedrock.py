import argparse
from mcstatus import BedrockServer

# Set up argument parser
parser = argparse.ArgumentParser(description="Check the status of a Minecraft Bedrock server.")
parser.add_argument(
    "address",
    type=str,
    help="The address of the Bedrock server in the format 'host:port' (e.g., 'localhost:19132')."
)

args = parser.parse_args()

# Use the provided address
server = BedrockServer.lookup(args.address)

# Get and display the server status
try:
    status = server.status()
    print(f"The server has {status.players.online} players online and replied in {status.latency} ms")
except Exception as e:
    print(f"Failed to retrieve server status: {e}")
