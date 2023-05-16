#!/bin/zsh

# Set your variables
LOG_FILE="$HOME/log_file.log"
COMPRESSED_DIR="$HOME/compressed_files"
UNCOMPRESSED_DIR="$HOME/uncompressed_files"
S3_BUCKET="$PROD_S3_BUCKET"
S3_OBJECT_KEY="anon-db.sql.gz"
AWS_PROFILE="default"

set -e
# Create directories if they don't exist
mkdir -p "$COMPRESSED_DIR"
mkdir -p "$UNCOMPRESSED_DIR"

# Function for logging
log() {
    echo "$(date +"%Y-%m-%d %H:%M:%S") - $1" >>"$LOG_FILE"
}

# Log start time
log "Start"

# Download compressed file from S3
log "Downloading compressed file from S3"
S3_URL=$(aws s3 presign "s3://${S3_BUCKET}/${S3_OBJECT_KEY}" --profile "$AWS_PROFILE")
COMPRESSED_FILE="$COMPRESSED_DIR/$(basename "$S3_OBJECT_KEY")"
curl -o "$COMPRESSED_FILE" "$S3_URL"

# Uncompress the file
log "Uncompressing the file"
UNCOMPRESSED_FILE="$UNCOMPRESSED_DIR/$(basename "$S3_OBJECT_KEY" .gz).txt"
gzip -dc "$COMPRESSED_FILE" >"$UNCOMPRESSED_FILE"

# Keep only the last 7 compressed files
log "Removing old compressed files"
ls -t "$COMPRESSED_DIR" | tail -n +8 | xargs -I {} rm -- "$COMPRESSED_DIR/{}"

# Log compressed and uncompressed file sizes
log "Compressed file size: $(du -sh "$COMPRESSED_FILE" | cut -f1)"
log "Uncompressed file size: $(du -sh "$UNCOMPRESSED_FILE" | cut -f1)"

# Log end time
log "End"
