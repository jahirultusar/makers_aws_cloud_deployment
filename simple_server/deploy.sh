#!/bin/bash

# Variables - EDIT PLACEHOLDERS AS NEEDED
KEY_PATH=~/.ssh/jahirul_cloud_deployment.pem
EC2_HOST=ec2-user@3.9.188.170
REMOTE_DIR=/home/ec2-user/flask-app

# Copy necessary files
echo "> Uploading files to EC2"
scp -i $KEY_PATH app.py requirements.txt Dockerfile $EC2_HOST:$REMOTE_DIR

# Connect and run container
ssh -i $KEY_PATH $EC2_HOST << EOF
  cd flask-app
  docker build -t my-flask-app .
  docker stop my-flask-app || true
  docker rm my-flask-app || true
  docker run -d -p 5001:5001 --name my-flask-app my-flask-app
EOF

echo "✅ Deployment complete! Visit: http://3.9.188.170:5001"

