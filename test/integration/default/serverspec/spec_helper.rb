require 'serverspec'
require 'busser'

include Serverspec::Helper::Ssh
include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS
