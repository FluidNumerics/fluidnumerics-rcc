# Getting Started on the Research Computing Cloud

The Research Computing Cloud (RCC) cluster is a cloud-native cluster hosted on Google Cloud, but is set up to be similar to other HPC/RC resources at your organization.

## New to the Research Computing Cloud ?

### Account Creation & Setup
Access is granted to the cluster through your fluidnumerics.cloud account.
To request support for a new account, you can reach out to [Fluid Numerics' RCC Support](https://fluidnumerics.atlassian.net/servicedesk/customer/portal/9/group/56/create/165)


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

### Logging In
Once you have an ssh key attached to your Cloud Identity profile, you can access the RCC cluster via ssh from Windows, Mac, and Linux workstations.
```
ssh your_username@{ip-address}
```

## Next Steps

* [Migrating Data to the Cloud](../datastorage/README.md)
* [Accessing Software]()
* [Submitting Jobs with Slurm](../jobs/README.md)
* [Learn more about available hardware](../hardware/README.md)
