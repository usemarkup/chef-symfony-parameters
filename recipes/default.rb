node[:symfony][:config].each do |name, config|
  unless config.has_key? 'config'
    raise "Config must include the name of the config file"
  end

  unless config.has_key? 'file'
    raise "Config must include the name of the file you want created"
  end

  unless node[:symfony][:configset].has_key? config[:config]
    raise "node[:symfony][:configset] does not have a config for `#{config[:config]}`"
  end

  configset = Chef::Mixin::DeepMerge.hash_only_merge(
    node[:symfony][:configset][:default], 
    node[:symfony][:configset]["#{config[:config]}"]
  )

  unless node[:symfony][:configset].has_key? config[:config]
    raise "node[:symfony][:configset] does not have a config for `#{config[:config]}`"
  end

  template config.file do
    cookbook configset[:cookbook]
    source configset[:template]
    mode '0775'
    owner node[:symfony][:user]
    group node[:symfony][:group]
    variables({
       :param => configset[:parameters]
    })
  end
end
