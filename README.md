# 🛑 Terraform IAM Management Repository

> **WARNING:** This repository manages the lifecycle of highly privileged, foundational IAM resources for the entire automated infrastructure. Changes to this codebase can impact all Terraform pipelines and should only be made with explicit approval from the Cloud Engineering Team leads.

## Purpose & Management Function

It uses a manually-configured, high-privilege **Bootstrap Credential** to perform its ongoing management tasks, which include:

1. **Creating** new, domain-specific IAM users and roles when a new project is onboarded.
2. **Updating** the policies for existing IAM users when a project's infrastructure needs change (e.g., adding permissions for a new AWS service).
3. **Deleting** IAM users and roles when a project is decommissioned.

The credentials for every user managed by this repository are securely and automatically published to our central secret store (HCP Vault Secrets).

## Workflow

1. **Trigger:** This pipeline is triggered exclusively via its GitHub Actions workflow upon a merge to the `main` branch. It is an API-driven workspace in Terraform Cloud.
2. **Authentication:** It authenticates to AWS and HCP using the `bootstrap-credentials` Variable Set.
3. **Action:** It runs `terraform apply` to reconcile the state of our IAM users and roles with the definitions in this repository.
4. **Output:** It populates or updates secrets in HCP Vault Secrets for each managed user.

## Operational Notes

* **Frequency of Changes:** This code should only change when onboarding a new project or adjusting the core permissions for an existing project.
* **DO NOT** add any application-specific infrastructure (e.g., S3 buckets, EC2 instances) to this repository. Its scope is strictly limited to IAM management for the Terraform pipelines.