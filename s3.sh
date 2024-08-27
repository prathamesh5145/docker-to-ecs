#!/bin/bash

# Variables
BUCKET_NAME="prathamesh5145"
OBJECT_KEY="studentapp-2.2-SNAPSHOT.war "
REGION="ap-south-1"
LOCAL_FILE_NAME="studentapp-2.2-SNAPSHOT.war"

# Download the latest version of the object
aws s3 cp s3://$BUCKET_NAME/$OBJECT_KEY $LOCAL_FILE_NAME --region $REGION

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "Download successful: $LOCAL_FILE_NAME"
else
    echo "Download failed"
fi
