require 'serverspec'

set :backend, :exec

describe file('/home/bobl/check_tv.sh') do
   it { should exist }
   it { should contain "#!/bin/bash" }
   it { should be_owned_by('bobl') }
   it { should be_grouped_into('bobl') }
   it { should be_readable.by('owner') }
   it { should be_executable.by('owner') }
   it { should be_readable.by('group') }
   it { should be_readable.by('others') }
end

describe process("check_tv.sh") do
  its(:count) { should eq 1 }
  its(:user) { should eq "bobl" }
end
