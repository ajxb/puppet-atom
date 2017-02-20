# atom

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with atom](#setup)
    * [What atom affects](#what-atom-affects)
    * [Beginning with atom](#beginning-with-atom)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

The atom module installs and configures the [atom](https://atom.io/) application from [ppa](https://launchpad.net/~webupd8team/+archive/ubuntu/atom) on Ubuntu.

This module is capable of configuring atom to work effectively on virtual machines

## Setup

### What atom affects

* apt configuration to include atom ppa
* /usr/share/applications/atom.desktop to handle --disable-gpu parameter if required
* /etc/profile.d/atom.sh to add in specific alias to handle --disable-gpu if required

### Beginning with atom

To install atom with default options:

`include atom`

To customize options, such as whether the --disable-gpu command line parameter is passed to atom:

```puppet
class { 'atom':
  disable_gpu => true,
}
```

## Usage

The default atom class installs atom and configures the tool correctly for use on a physical or virtual machine. In the case of a virtual machine, the tool is configured to have the --disable-gpu flag passed to it, as gpu acceleration seems to have issues when running on a virtual machine. To use default configuration:

`include atom`

To manually configure the use of the --disable-gpu flag:

```puppet
class { 'atom':
  disable_gpu => true,
}
```

## Reference

### Classes

#### Public classes

* `atom`: Installs and configures atom

#### Private classes

* `atom::params`: Handles the module default parameters
* `atom::config`: Handles the configuration files
* `atom::install`: Handles the ppa setup and the atom package

### Parameters

The following parameters are available in the `atom` class:

#### `disable_gpu`

Data type: Boolean.

Specifies whether the atom application should be configured so that it is invoked with the --disable-gpu flag.

Default value:

* `true` if is_virtual fact is true
* `false` otherwise

#### `package_ensure`

Data type: String.

Whether to install the atom package, and what version to install. Values: The same as used for the puppet package type, see [https://docs.puppet.com/puppet/latest/type.html#package-attribute-ensure](https://docs.puppet.com/puppet/latest/type.html#package-attribute-ensure)

Default value: 'latest'.

## Limitations

This module has only been tested against Ubuntu 16.04.  As atom is a desktop application this module will only produce tangible results when used with a desktop variant of Ubuntu.

## Development

### Contributing

Before starting your work on this module, you should fork the project to your GitHub account. This allows you to freely experiment with your changes. When your changes are complete, submit a pull request. All pull requests will be reviewed and merged if they suit some general guidelines:

* Changes are located in a topic branch
* For new functionality, proper tests are written
* Changes should not solve certain problems on special environments
* Your change does not handle third party software for which dedicated Puppet modules exist
  * such as creating databases, installing webserver etc.
* Changes follow the recommended Puppet style guidelines from the [Puppet Language Style Guide](https://docs.puppet.com/puppet/latest/style_guide.html)

### Branches

Choosing a proper name for a branch helps us identify its purpose and possibly find an associated bug or feature. Generally a branch name should include a topic such as `bug` or `feature` followed by a description and an issue number if applicable. Branches should have only changes relevant to a specific issue.

```
git checkout -b bug/service-template-typo-1234
git checkout -b feature/config-handling-1235
```

### Running tests

This project contains tests for both [rspec-puppet](http://rspec-puppet.com/) to verify functionality. For detailed information on using this tool, please see the relevant documentation.

#### Testing quickstart

```
gem install bundler
bundle install
rake spec
```
