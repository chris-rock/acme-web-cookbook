# acme-web-cookbook

## Preparation

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

## Integration Testing: InSpec for Infrastructure Testing

```
$ ssh chef@IP -L 8080:localhost:8080 -L 8443:localhost:8443
$ git clone https://github.com/chris-rock/acme-web-cookbook
$ cd acme-web-cookbook
$ chef exec kitchen list
$ chef exec kitchen converge default-ubuntu-1404
$ chef exec kitchen verify default-ubuntu-1404
```

## Write integration tests with InSpec

Add the following integration tests:

  - InSpec docs on InSpec.io
  - check that port 443
  - check that package 'nginx' is installed
  - service 'nginx' is running
  - `/usr/share/nginx/inspec` exists
  - `/usr/share/nginx/inspec/index.html` is running

## InSpec for Compliance

Use the following benchmarks in your cookbook:
- https://github.com/dev-sec/tests-os-hardening
- https://github.com/dev-sec/tests-ssh-hardening

Remediate the the issues in test-kitchen with
- https://github.com/dev-sec/chef-os-hardening
- https://github.com/dev-sec/chef-ssh-hardening
