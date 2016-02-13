# chef_provisioning_vagrant

An example running Chef Provisioning locally using the Vagrant driver.

## Getting Setup

#### Cookbooks

Place any of athe cookbooks you depend on in the `Berksfile`. Once you have everything you need in the `Berksfile`, you can run `rake provision` to kick off the provisioning process.

#### Other Data

If you require any other chef server data, such as data bags or roles, you can place them in the appropriate folder under `test/fixtures`. They should be picked up automatically by the chef-zero server. 

## Provisioning the Machines

The included `Rakefile` contains two tasks. 

#### Vendor

The first task is used to vendor all of your cookbook dependencies into a subfolder, so that they are available to the machines being provisioned. 

#### Provision

The second task executes a `chef-client` run using local mode (`-z`), and provides an override (`-o`) run list. The run list should be the provisioning recipe you wish to execute.

