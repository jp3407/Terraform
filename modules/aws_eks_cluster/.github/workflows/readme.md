# Github workflow to trigger deployment
### 1. **Set Up GitHub Secrets**

First, you need to set up a **Personal Access Token (PAT)** in your GitHub repository to access the repository containing the `terraform.tfvars` file.

1. Go to **Settings > Secrets and variables > Actions** in your repository.
2. Add a new secret called `REPO_ACCESS_TOKEN` with your personal access token.

### 2. **Create the GitHub Workflow**

Create a `.github/workflows/terraform-deploy.yml` file in your repository and use the following YAML as a starting point:

### Breakdown of Steps:

1. **Trigger on Changes to `terraform.tfvars`**: The `push` event is set to trigger the workflow whenever changes are made to the `terraform.tfvars` file. Adjust the `branches` field as needed.
2. **Checkout the Repository**: The first `checkout` step pulls the current repository code.
3. **Setup Terraform**: Uses the `hashicorp/setup-terraform` action to set up Terraform.
4. **Get `terraform.tfvars` from Another Repository**: The `actions/checkout` is used again to pull the `terraform.tfvars` file from another repository. Ensure the repository name and access token are correct.
5. **Terraform Init**: Initializes the Terraform configuration.
6. **Terraform Plan**: Runs a `terraform plan` with the `terraform.tfvars` file.
7. **Terraform Apply**: (Optional) If you want to apply the changes automatically, uncomment the `Terraform Apply` step.

### 3. **Additional Notes**:

- Replace `<OWNER>/<REPO_WITH_TFVARS>` with the owner and repository name where the `terraform.tfvars` file is located.
- The `terraform.tfvars` file will be downloaded into the `terraform-tfvars` directory, and the Terraform command will use it with the `var-file` flag.
- The workflow will trigger every time there is a push to the branch specified and when the `terraform.tfvars` file changes.

This setup should automate the deployment of your Terraform configuration when the `terraform.tfvars` file is modified in the other repository!

