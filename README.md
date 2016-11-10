# acme-web-cookbook

### Preparation

- Install ChefDK
- chef gem install kitchen-docker

### Verify the correct setup

```
chef exec kitchen list
Instance                Driver  Provisioner  Verifier  Transport  Last Action
default-ubuntu-1404     Docker  ChefZero     Inspec    Ssh        <Not Created>
hardening-ubuntu-1404   Docker  ChefZero     Inspec    Ssh        <Not Created>
compliance-ubuntu-1404  Docker  ChefZero     Inspec    Ssh        <Not Created>
```

```
chef exec kitchen converge default-ubuntu-1404
...
```
