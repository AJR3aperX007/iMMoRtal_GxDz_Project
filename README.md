# iMMoRtal_GxDz_Project

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Diagram](./Images/diagram_filename.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YAML file may be used to install only certain pieces of it, such as Filebeat.

  - Ansible/elk-playbook.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly responsive, in addition to restricting traffic to the network.
- Load Balancers redirect traffic to cover traffic overload and protect against DOS Attacks. The advantage of having a Jump Box is that it acts as a gateway router and is exposed to the internet to sit in front of the VMs that are not exposed to the internet.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the containers and system files.
- Filbeat watches for and collects log files

The configuration details of each machine may be found below.

| Name                 | Function   | IP Address | Operating System       |
|----------------------|------------|------------|------------------------|
| Jump-Box-Provisioner | Gateway    | 10.1.0.7   | Linux Ubuntu 18.04-LTS |
| Web-1                | Web Server | 10.1.0.5   | Linux Ubuntu 18.04-LTS |
| Web-2                | Web Server | 10.1.0.6   | Linux Ubuntu 18.04-LTS |
| ELK-SERVER           | Kibana IDS | 10.2.0.4   | Linux Ubuntu 18.04-LTS |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box-Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- IP Address: 25.76.39.140

Machines within the network can only be accessed by Jump-Box-Provisioner.
- Web-1: 10.1.0.5
- Web-2: 10.1.0.6

A summary of the access policies in place can be found in the table below.

| Name                 | Publicly Accessible | Function   | IP Addresses           |
|----------------------|---------------------|------------|------------------------|
| Jump-Box-Provisioner | Yes                 | SSH        | 10.1.0.7 138.91.153.30 |
| Web-1                | No                  | Web Server | 10.1.0.5               |
| Web-2                | No                  | Web Server | 10.1.0.6               |
| ELK-SERVER           | Yes                 | Kibana IDS | 10.2.0.4 52.255.141.84 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because:
- This allows for quick deployment
- You can get streamlined Containers through Docker Hub and configure different VMs

The playbook implements the following tasks:
- Uses apt module docker.io
- Intalls pip3 & Docker Python Module
- Increases Virutal Memory and Uses More Memory
- Downloads and launches the Docker Elk Container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

- Ansible/Docker PS.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1: 10.1.0.5
- Web-2: 10.1.0.6

We have installed the following Beats on these machines:
- Web-1: Filebeat
- Web-2: Filebeat

These Beats allow us to collect the following information from each machine:
- Filebeat allows us to collect and monitor log events on remote machines.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the elk-playbook.yml file to /etc/Ansible.
- Update the hosts file in Ansible to include:

  [webservers]
  - 10.1.0.6 ansible_python_interpreter=/usr/bin/python3
  - 10.1.0.5 ansible_python_interpreter=/usr/bin/python3

  [elkservers]
  - 10.2.0.4 ansible_python_interpreter=/usr/bin/python3

- Run the playbook, and navigate to the PLAY RECAP to check that the installation worked as expected. Navigate to Kibana using 52.255.141.84:5601 to chek that the ELK Server is running.
