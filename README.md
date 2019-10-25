# Azure WebApp Service terraform
This repo created for .net core application infra, this application will be deployed to Web App service 

## Terraform State

- Remote State

For this repository I am using remote state becuase my deployment going through Azure DevOps and its manage the states to Azure Stroage account. All remote state info describe in remote_stage.tf file. 

## Variables

| Variable      | Value | Description |
| ------------- | ------------- | ------------- | 
| location       | centralus   | Location use for spin up the resouces for that location |