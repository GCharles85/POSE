#!/bin/bash

# Variables
PROJECT_ID="your-google-cloud-project-id"
REGION="your-region"
MODEL_NAME="your-model-name"
INSTANCE_NAME="your-instance-name"
MACHINE_TYPE="your-machine-type" # E.g., "n1-standard-4"
FRAMEWORK="your-framework" # E.g., "TENSORFLOW"

# Create a new AI instance
gcloud ai-platform models create $INSTANCE_NAME \
    --project=$PROJECT_ID \
    --region=$REGION \
    --machine-type=$MACHINE_TYPE \
    --framework=$FRAMEWORK \
    --model-name=$MODEL_NAME

# Output the instance creation status
if [ $? -eq 0 ]; then
    echo "AI instance '$INSTANCE_NAME' created successfully in project '$PROJECT_ID'."
else
    echo "Failed to create AI instance."
fi
