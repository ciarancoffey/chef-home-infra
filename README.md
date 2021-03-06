#Goals
Create a boblight user and install a script to be run in their home dir

The scope will creep to cover everything I run on my home machine, but getting boblightd to run is enough for now.

boblightd should only run if my TV is on, so there's a simple bash script which checks if it is on.

##Starting out
You should clone this repository and add your private key file from Chef, ccoffey-validator.pem and encrypted_data_bag_secret in the .chef directory.

There is a data bag and an encrypted data bag, for sshy public and private keys, but we're not using them yet here.

The chef cookbook is `./cookbooks/home_infra`

And the tests are in `./tests/`

##Bootstrap new host:
`knife bootstrap ssh.ccoffey.ie -x ccoffey --environment prod --sudo --secret-file .chef/encrypted_data_bag_secret`

##Setup a vagrant environment.
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

##Doing tests

We can't run tests against arch yet, as support for arch in kitchen is minimal.
We can run our tests on ubuntu though. Arch can be a chef-client though, so the final output is the same.

Some tests are in bats, and live under `./test/integration/default/bats/`

More are in serverspec, and live under `./test/integration/default/serverspec/`

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

##Adding to cookbook
The recipes that can be run (what runs is defined in the chef console) are in `./cookbooks/home_infra/recipies/`
As above, write the test first, 

After an update, do a version bump in `./cookbooks/home_infra/metadata.rb`

`berks update && berks upload`

This is necessary to get the chef server to know the cookbook has been modified.

Test it fails `kitchen verify`, 

add the recipe and converge `kitchen converge`
