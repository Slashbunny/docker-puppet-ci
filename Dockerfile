FROM ubuntu:16.04

# Update and Install Build Deps
RUN apt-get update -y && apt-get dist-upgrade -y && \
    apt-get install -y wget rubygems

# Install Official Puppet Repository
RUN wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb && \
    dpkg -i puppetlabs-release-pc1-xenial.deb && \
    apt-get update -y

# Install Puppet, Build Tools
RUN apt-get install -y puppet ant

# Install puppet-lint
RUN gem install puppet-lint

# Cleanup
RUN apt-get remove --purge -y wget rubygems && \
    apt-get autoclean -y && apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*
