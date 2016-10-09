
# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options
#
# current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
client_key               '/home/ccoffey/chef-infra/.chef/ccoffey.pem'
node_name                "ccoffey"
validation_client_name   'ccoffey-validator'
validation_key           '/home/ccoffey/chef-infra/.chef/ccoffey-validator.pem'
chef_server_url          "https://api.chef.io/organizations/ccoffey"
cookbook_path            ["#{current_dir}","./cookbooks"]
syntax_check_cache_path  '/home/ccoffey/chef-infra/.chef/syntax_check_cache'
