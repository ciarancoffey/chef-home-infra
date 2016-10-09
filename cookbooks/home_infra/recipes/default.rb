#
# Cookbook Name:: home_infra
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
user 'bobl' do
      home '/home/bobl'
      supports manage_home: true
      action [:create]
end

