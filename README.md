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
