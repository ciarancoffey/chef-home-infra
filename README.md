#Starting out
You should clone this repository and add your private key file from Chef, ccoffey-validator.pem and encrypted_data_bag_secret in the .chef directory.

##Bootstrap new host:
`knife bootstrap ssh.ccoffey.ie -x ccoffey --environment prod --sudo --secret-file .chef/encrypted_data_bag_secret`

#Setup a vagrant environment.
I use arch as a dev machine, as usual, follow the excellent [arch wiki](https://wiki.archlinux.org/index.php/Vagrant)

`vagrant init terrywang/archlinux`
```
$ cat Vagrantfile
Vagrant.configure("2") do |config|
  config.vm.box = "terrywang/archlinux"
  config.vm.provider :virtualbox do |p|
           end
end
```
`vagrant up`

Verify it's up

`vagrant global-status`

`ssh localhost -p 2222 -l vagrant`

#Doing tests

We can't run tests against arch yet, as support for arch in kitchen is minimal.
We can run our tests on ubuntu though.

Test are in bats, and live under `./test/integration/default/bats/`

##Adding tests.
Test should be added before the work is done to pass the test, i.e. red-green development.
e.g.
A new test was created to check if a user's home directory, but we've not added the recipe yet to create it.

`kitchen verify` confirms this:

```
-----> Running bats test suite
 ✓ chef-client binary is found in PATH
 ✓ user should exist
 ✗ user home_dir should exist
          (in test file /tmp/verifier/suites/bats/user_exists.bats, line 11)
            `[ "$status" -eq 0 ]' failed
       
       3 tests, 1 failure
```

```$ kitchen list
Instance                     Driver   Provisioner  Verifier  Transport  Last Action
default-ubuntu-1404	     Vagrant  ChefSolo     Busser    Ssh        <Not Created>
default-terrywang-archlinux  Vagrant  ChefSolo     Busser    Ssh        <Not Created>
```
