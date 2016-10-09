cookbook_file "/home/bobl/check_tv.sh" do
  source "check_tv.sh" 
  owner "bobl"
  group "bobl"
  mode "744"
end

execute 'check_tv.sh' do
  command "nohup 2>&1 /home/bobl/check_tv.sh > /home/bobl/nohup.out &"
  cwd '/home/bobl'
  user "bobl"
  not_if 'pgrep check_tv.sh'
end
