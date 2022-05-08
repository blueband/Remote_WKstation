
- Terraform Backend Setup
    Depend on where you wishes to have your Terraform state files saved, there is option for
    1. remote    # Terraform Cloud backend see below for peculiar setting
    2. gsc/azure/aws   # This is applicable to any of Cloud provider such as Google, Azure and AWS
    3. None, when you did not declare backend tag, Terraform will save your state files on your loca machine

- Why Save your state file remotely

- Setup Github Action with Terraform Cloud:
  1. Read Here

- If your backend is `remote` follow this additional step

Place your credentials in a Terraform Cloud environment variable:

    1. Create an environment variable called `GOOGLE_CREDENTIALS` in your Terraform Cloud workspace.
    2. Remove the newline characters from your JSON key file and then paste the credentials into the environment variable value field. You can use the  command to strip newline characters. `cat key.json | tr -s '\n' ' '`
    3. Mark the variable as Sensitive and click Save variable.
NOTE: All runs within the workspace will use the GOOGLE_CREDENTIALS variable to authenticate with Google Cloud Platform.

Further reading here https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference: 

- Enviroment variable
  - `GCP_CREDENTIAL`
  - `TF_API_TOKEN`

- Section:  SETUP CI/CD with Github Action workflow
  - Create an empty new repo on Github