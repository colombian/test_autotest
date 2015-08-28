Vagrant.configure('2') do |config|
  config.vm.box      = 'xbp-ubuntu-14041-ruby211-x64'
  config.vm.box_url  = 'https://s3-us-west-1.amazonaws.com/boxes.redtail/xbp-ubuntu-14041-ruby211-x64.box'
  config.vm.hostname = 'rails-dev-box'

  config.vm.network :forwarded_port, guest: 8080, host: 8080

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path    = 'puppet/modules'
  end
end
