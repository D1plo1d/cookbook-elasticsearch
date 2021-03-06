# Load configuration and credentials from data bag 'elasticsearch/aws' -
#
aws = Chef::DataBagItem.load('elasticsearch', 'aws') rescue {}
# ----------------------------------------------------------------------

default.elasticsearch[:plugin][:aws][:version] = '2.2.0'
default.elasticsearch[:plugin][:aws][:name] = "cloud-aws"
default.elasticsearch[:plugin][:aws][:url] = "elasticsearch/elasticsearch-cloud-aws/#{node.elasticsearch[:plugin][:aws][:version]}"

# === AWS ===
# AWS configuration is set based on data bag values.
# You may choose to configure them in your node configuration instead.
#
default.elasticsearch[:gateway][:type]               = ( aws['gateway']['type']                rescue nil )
default.elasticsearch[:discovery][:type]             = ( aws['discovery']['type']              rescue nil )
default.elasticsearch[:gateway][:s3][:bucket]        = ( aws['gateway']['s3']['bucket']        rescue nil )

default.elasticsearch[:cloud][:ec2][:security_group] = ( aws['cloud']['ec2']['security_group'] rescue nil )
default.elasticsearch[:cloud][:ec2][:any_group]      = ( aws['cloud']['ec2']['any_group']      rescue true )

default.elasticsearch[:cloud][:aws][:access_key]     = ( aws['cloud']['aws']['access_key']     rescue nil )
default.elasticsearch[:cloud][:aws][:secret_key]     = ( aws['cloud']['aws']['secret_key']     rescue nil )
default.elasticsearch[:cloud][:aws][:region]         = ( aws['cloud']['aws']['region']         rescue nil )
