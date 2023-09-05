# Getting Started on the Research Computing Cloud

The Research Computing Cloud (RCC) cluster is a cloud-native cluster hosted on Google Cloud, but is set up to be similar to other HPC resources at your organization.

### Account Creation

For accounts on Ogopogo and Armory, you can access the cluster using a fluidnumerics.cloud account.
To request a new account, you can reach out to [Fluid Numerics' RCC Support](https://fluidnumerics.atlassian.net/servicedesk/customer/portal/9/group/56/create/165). Once your account is created, you will need to follow the instructions sent to your email to reset your accounts password.

### Adding SSH Keys
Once you have completed the initial account setup, you will need to attach SSH keys to your account using the RCC User Account Manager.

!!! note
    To access the RCC User Account Manager App, you will need to log in using your fluidnumerics.cloud credentials.

#### RCC User Account Manager App
[Access via your browser](https://www.appsheet.com/start/8585ebf6-032c-4a08-95a6-34702bae6bb8){ .md-button .md-button--primary }
[Install on your smartphone](https://www.appsheet.com/newshortcut/8585ebf6-032c-4a08-95a6-34702bae6bb8){ .md-button .md-button--primary }


### Logging In
Once you have an ssh key attached to your Cloud Identity profile, you can access the RCC cluster via ssh from Windows, Mac, and Linux workstations.
```
ssh your_username@{ip-address}
```

#### Ogopogo
If you are using Fluid Numerics' shared Ogopogo cluster, you can log in using 
```
ssh your_username@ogopogo.fluidnumerics.cloud
```


## Clusters deployed in your Google Cloud project
If you'd like to schedule an onboarding video call to quickly get you through the onboarding process, reach out to [rcc-support@fluidnumerics.com](mailto:rcc-support@fluidnumerics.com). 

[Contact Fluid Numerics RCC Support :fontawesome-solid-paper-plane:](mailto:rcc-support@fluidnumerics.com){ .md-button .md-button--primary }

### Account Creation

If your cluster is deployed in your organization's Google Cloud project, you can access your RCC cluster using your GMail or Cloud Identity accounts. To create an account, your Google Workspace administrator will need to create a GMail or Cloud Identity account for you. Additionally, your Google Cloud IAM/Security Manager will need to grant you the following roles on the Google Cloud project hosting your cluster

* Compute OS Login
* Service Account User

### Adding SSH Keys
Once you have completed the initial account setup, you will need to attach SSH keys to your account using either the gcloud CLI or [Cloud Shell](https://shell.cloud.google.com/?show=terminal).

#### Using the gcloud CLI

#### Access via Cloud Shell
Google Cloud Shell provides a convenient Linux based terminal in your web-browser.

In your web browser, navigate to https://shell.cloud.google.com?show=terminal . *Make sure that you are logged in as your fluidnumerics.cloud account*. 

In Cloud Shell, set the Google Cloud project to `{customer-project}`,
```
gcloud config set project {customer-project}
```

Next, create an ssh key pair,
```
ssh-keygen -t rsa 
```
Accept the default path for storing the ssh key pair, and set a good password when prompted to protect your ssh key.

Next, attach the ssh key to your Cloud Identity profile
```
gcloud compute os-login ssh-keys add --key-file=${HOME}/.ssh/id_rsa.pub
```

Once this is done, you can log in to the cluster using ssh from Cloud Shell in your browser
```
ssh {ip-address}
```

## Next Steps

* [Migrating Data to the Cloud](../datastorage/README.md)
* [Accessing Software]()
* [Submitting Jobs with Slurm](../jobs/README.md)
* [Learn more about available hardware](../hardware/README.md)
