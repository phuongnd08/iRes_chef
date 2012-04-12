cookbook_path File.expand_path("../cookbooks", __FILE__)
json_attribs File.expand_path("../node.json", __FILE__)
log_level :info
log_location STDOUT
verbose_logging :debug
Chef::Config[:node_name] = "fuck.ires.com"
