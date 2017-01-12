FROM ubuntu:16.04

# Install Official Puppet Repository
RUN wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb && \
    dpkg -i puppetlabs-release-pc1-xenial.deb

# Update and Install Packages
RUN apt-get update -y && apt-get install -y \
    ant \
    openssh-client \
    puppet \
    rubygems \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install puppet-lint
RUN gem install puppet-lint

