#include_recipe 'chef-home-infra', :git => 'git@github.com:ciarancoffey/chef-home-infra.git'
include_recipe "chef-client"
include_recipe "sudo"
include_recipe "openssh"



log "infra available"
