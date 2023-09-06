# Application Porting Guide


Whenever you start using a new system, you will need to spend some time up front to get your applications running. This process is called "porting" and this short guide is meant to help you be successful. 
    
[Port your software to the cloud in four weeks with a mentored sprint](){ .md-button .md-button--primary }
    

## Porting Process

### Containers or bare-cloud ?
All of our RCC solutions come with Apptainer pre-installed. This allows you to run Docker or Apptainer containers on the cluster. Containers provide the advantage that you are in complete control of the environment inside your container; you can choose the operating system, compilers, and additional software packages you would like to have installed.

On the other hand, the "bare-cloud" approach requires your preferred compilers and software dependencies to be installed on the RCC VM images themselves. This can be done in your home directory space using tools like [Spack](https://spack.io). If you are using Python, you can use [Conda]() or [Python environments](). Alternatively, you can work with Fluid Numerics support team to have compilers and additional software installed on your VM images.



### Identify Software Requirements
With your approach in mind

