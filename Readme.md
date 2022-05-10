# REMOTE WORKSTATION
- Motivation:  As Data Engineer that lived in third world with low income, I continue finding it difficult to upgrade Computer hardware as result of tools in my chosen carrier. So in order to solve this problem , I look into cloud enviroment and GCP come to rescue by giving $300 to every new gmail
- WHY would anyone use this resource!, 
  - Ok, your Computer hardware comes preinstalled with 32GB RAM with core i9, but you need computing power of let say 64GB of RAM vCPU 32 to crunching data or perform highly memory or CPU intensive computing calculation
  - You are on low budget limited data plan or even slow download speed, you got tens of docker image to be dowload for your data pipeline or You are are building couple of docker images locaaly that need to be upload to either private/public registry, this resource will make sure everything is done smoothly in the remote machine.
  - You just need a "disposable" computing environment, once you are done, you want it to be shut-down even if you are having cup of coffee in Bahamas beach.
  - Cloud resource can quicly sky-rocket if not well managed, you want a self-disposable compute instance that does not dig hole in your financial pocket, then you will need this resource.
  - lastly, everything is automate, just supply few parameter, you are good to go!

# REQUIRMENT :
1. A Google Account to access GCE (create new account ($300 free credit is avaialable for your usage or use existing GCP account with billing active)
2. create GCP project
3. create Service account and generate json file (see below instruction)
4. Terraform installed on your local computer
5. Create Terraform Cloud Account to integrate into Github Action. See instruction below
6. Fork or clone this repo `https://github.com/blueband/Remote_WKstation.git`
7. Github Action
8. Create GCS bucket named `tf-tfstatefile`

# EVIROMENTS VARIABLE
  1. `GCS_TERRAFORM_GITHUB_SA`   See below on how to format the json file for thright output supported by GA Secret vault
  2. `SECRET_KEY_SSH`  (optional, if you want to setup SSH KEY, on the Remoste Workstation, Not Implemetent at Moment, See # TODO Section
  3.`TF_API_TOKEN`: To be generate from Terraform Cloud Account Read here on how to go about it
  4. `TF_PROJECTID`: GCP project ID, in which the resource will be create
  5. `ZONE`: GCP zone in which the resource will be create

# CHANGEABLE VALUE IN TERRAFORM
Note: Terraform Cloud works ONLY with `*.auto.tfvars` file (`terraform.tfvars` will be ignore)
  1.  `wkstation_boot_disk_size_gb` : Compute Hardisk size
  2.  `wkstation_machine_type` : Highly recommeded for change but dependend on your computing need. See below for `machine_type` tags for GCP compute 
  3.  `os_image`  : Operating Software  (default is "ubuntu-os-cloud/ubuntu-2110")
  4.  `desired_status`              = "RUNNING" # Manual methods of shut-down VM from Terraform.  optional can either take RUNNING or TERMINATED values.
  5.  `machine_name`  : change this to unique name (all symbol except '-' and English alphabets are not accept)
  6.  `disk_type`      : default is "pd-ssd" 
  7.  `wk_stop_update_status`     : default is true # To take advantage of upgradable machine type on GCP


# USAGE
  1. clone or fork this repo `https://github.com/blueband/Remote_WKstation.git`
  2. Edit `*.auto.tfvars` file See above CHANGEABLE VARIABLE
  3. create bucket named `tf-tfstatefile` if you haven't
  4. create secret in Github Action with name matching ENVIRONMENT VARIABLE listed above. Please, Github Action , Secret are repo based, So you will to create a repo on your Gihtub, push the files to it, then follow instruction on how to setub Secret in GA in the link below
  5. Setup API in Terraform Cloud See instruction below
  6. Once, all parameter above are setup, push the code into a staging branch in your repo created earlier (name it whatever, I used `dev`)
  7. Raise PR to `main` branch from your staging branch,  this will trigger `terraform plan` stage, see it under `Action` tab in the current repo
  8. If everything went smoothly, you can then `merge` and this will triggered `terraform apply` stage, whch will create VM in your GCP account


BONUS: There exist in-built script that monitor resources usage on the created VM, once resource usage threshold is below 10% threshold, the Remote workstation will shut down gracefully and save you of unneaccesary bills from Google.

Hope you like this !

# HOW TO ACCESS OUR VM THROUGH VSCODE (for code, pipeline development) 
  Local Machine OS: ubuntu
   1. Create SSH KEY, if you have not create one before, follow instruction here https://confluence.atlassian.com/bitbucketserver/creating-ssh-keys-776639788.html
   2. After step above, copythe output of this command `cat ~/.ssh/{"name_use_above.pub"}` # replace {"name_use_above.pub"} with name of your public key as found at `ls ~/.ssh/`
   3. In GCP console, Go to Compute Engine → Metadata, Select SSH tab, click Edit button, Then just edit or add your SSH key there.
   4. Go back to the VM dashboard, grab your machine Public IP
   5. On Your VSCODE IDE, click on `View`, then `Command paltete` then type `ssh` in the prompt, look for `Open SSh Configuration file` and click on it, then click on `~/.ssh/config`
   6. Enter the following 
1. 
   ``` 
   Host NAME_OF_YOUR_CHOICE
      HostName IP_OF_REMOTE_MACHINE_COPY_AT_STEP_4_ABOVE
      User YOUR_LOCAL_USERNAME_NOT ROOT
      IdentityFile  ~/.ssh/PRIVATE_KEY_FILE   # IT DOES NOT HAVE ".PUB" EXTENTION
      IdentitiesOnly yes

      ```
  1. Once above parameteer are replace accordingly, we can test access to the remote machine by
      1. from Terminal issues the following command 1 `ssh NAME_OF_YOUR_CHOICE`   NOTE: NAME_OF_YOUR_CHOICE is the name we defile in the file above
      if everything is fine, we will be able to login into the Remote workstation
      1. From VSCODE,  go to `View` -> `Command paltete` -> `Connect to Host` click on the name specified above when we edit config file. If everything is setup correctly, VSCODe will connect to the remote machine and all your works, developmet will be save on the remote machine. Everything you do locally on VSCODE can now be doneon the Remote Workstation.




# TO DO
  1. Adding Local machine public SSH-KEY to the remote machine via GA
  2. Ability to create more than one VM (POC)

# Resources
1. Terraform cloud
2. Github Action
3. https://gcpinstances.doit-intl.com/   View GCP machine_type, price, RAM, vCPU
4. Shut Down Script : https://gist.githubusercontent.com/justinshenk/312b5e0ab7acc3b116f7bf3b6d888fa4/raw/59f021c2bf0388ba36e5a589dba52e233ee84964/idle-shutdown.sh
5. https://medium.com/analytics-vidhya/how-to-auto-shutdown-an-idle-vm-instance-on-gcp-to-cut-fat-bills-b08ae20437af


