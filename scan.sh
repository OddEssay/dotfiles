#!/bin/bash

# Run your custom command and capture its output
output=$(networkquality -c)

# Extract relevant fields using jq
base_rtt=$(echo "$output" | jq '.base_rtt')
dl_throughput=$(echo "$output" | jq '.dl_throughput')
ul_throughput=$(echo "$output" | jq '.ul_throughput')
interface_name=$(echo "$output" | jq -r '.interface_name')

# Print a summary of results
echo "Network Quality Summary:"
echo "  Base RTT: $base_rtt ms"
echo "  Download Throughput: $dl_throughput"
echo "  Upload Throughput: $ul_throughput"
echo "  Interface Name: $interface_name"
