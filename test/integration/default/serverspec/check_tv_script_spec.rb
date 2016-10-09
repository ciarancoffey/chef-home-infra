require 'serverspec'

set :backend, :exec

describe file('/home/bobl/check_tv.sh') do
	  it { should exist }
end
