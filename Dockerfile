FROM ubuntu:16.04

# Update and Install Packages
RUN apt-get update -y && apt-get install -y \
    ant \
    openssh-client \
    rubygems \
    wget

# Install Official Puppet Repository
RUN wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb && \
    dpkg -i puppetlabs-release-pc1-xenial.deb && \
    rm puppetlabs-release-pc1-xenial.deb

# Install Puppet
RUN apt-get update -y && apt-get install -y puppet

# Install puppet-lint
RUN gem install puppet-lint

# Clean up unneeded directories
RUN rm -rf /var/lib/apt/lists/*

