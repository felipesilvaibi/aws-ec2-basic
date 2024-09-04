# CI/CD Pipeline with Terraform, AWS, and GitHub Actions

This repository contains a Node.js application with Terraform infrastructure code and a CI/CD pipeline that deploys the application to an EC2 instance on AWS. The pipeline is automated using GitHub Actions, and the infrastructure is provisioned using Terraform.

## Prerequisites

*   **AWS Account**: An AWS account with sufficient permissions to provision EC2 instances, create security groups, and manage other resources.

*   **GitHub Repository**: A GitHub repository to host your code and manage the CI/CD pipeline using GitHub Actions.


***

## Step-by-Step Configuration Guide

### Step 1: AWS Configuration

#### 1.1. Create an AWS IAM User

1.  Go to the **IAM Console**: [IAM Management Console](https://console.aws.amazon.com/iam/)

2.  Create a new **IAM user** with the following:

    *   **Access type**: Programmatic access (for access keys)

    *   **Permissions**: Attach the policies below:

        *   `AmazonEC2FullAccess`

        *   `AmazonS3FullAccess`

        *   `IAMFullAccess`

        *   `CloudWatchFullAccess`

3.  After creating the user, download the **Access Key ID** and **Secret Access Key**. These will be added as secrets in GitHub.

#### 1.2. Generate an SSH Key Pair

1.  Go to the **EC2 Console**: [EC2 Management Console](https://console.aws.amazon.com/ec2/)

2.  In the **Key Pairs** section, generate a new key pair:

    *   **Key name**: e.g., `my-key`

    *   **Key type**: RSA

    *   **Key format**: `.pem` (for Linux/Mac) or `.ppk` (for PuTTY/Windows)

3.  Download the key file. This will be used to SSH into your EC2 instance if needed.

#### 1.3. Store the Key Name in AWS Systems Manager (optional but recommended)

Instead of hardcoding your `key_name` in the Terraform configuration, you can store it in **AWS Systems Manager Parameter Store**:

1.  Go to the **Systems Manager Console**: [Systems Manager](https://console.aws.amazon.com/systems-manager/)

2.  Create a parameter:

    *   **Name**: `/my-app/key-name`

    *   **Type**: String

    *   **Value**: The key name you generated (e.g., `my-key`)

***

### Step 2: GitHub Secrets Configuration

To securely pass sensitive information like AWS credentials and the SSH key name to your GitHub Actions pipeline, follow these steps:

1.  **Go to your GitHub repository**.

2.  **Navigate to Settings > Secrets and variables > Actions > New repository secret**.

Add the following secrets:

*   `AWS_ACCESS_KEY_ID`: The **Access Key ID** from the AWS IAM user you created.

*   `AWS_SECRET_ACCESS_KEY`: The **Secret Access Key** from the AWS IAM user.

*   `AWS_KEY_NAME`: The name of the SSH key pair (e.g., `my-key`).

*   `AWS_REGION`: The region where your EC2 instance will be deployed (e.g., `us-east-1`).

**Example**:

| Secret Name             | Value             |
| :---------------------- | :---------------- |
| `AWS_ACCESS_KEY_ID`     | `AKIA...`         |
| `AWS_SECRET_ACCESS_KEY` | `YOUR_SECRET_KEY` |
| `AWS_KEY_NAME`          | `my-key`          |
| `AWS_REGION`            | `us-east-1`       |

