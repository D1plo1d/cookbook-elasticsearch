# Load settings from data bag 'elasticsearch/settings' -
#
settings = Chef::DataBagItem.load('elasticsearch', 'settings') rescue {}

# === VERSION ===
#
default.elasticsearch[:version]   = "1.2.2"

# === PATHS ===
#
default.elasticsearch[:dir]       = "/usr/local"
default.elasticsearch[:user]      = "elasticsearch"
default.elasticsearch[:conf_path] = "/usr/local/etc/elasticsearch"
default.elasticsearch[:data_path] = "/usr/local/var/data/elasticsearch"
default.elasticsearch[:log_path]  = "/usr/local/var/log/elasticsearch"
default.elasticsearch[:pid_path]  = "/usr/local/var/run/elasticsearch"

# === MEMORY ===
#
# Maximum amount of memory to use is automatically computed as 1/2 of total available memory.
# You may choose to configure it in your node configuration instead.
#
# Setting min_mem to false will cause the min_mem to equal the max_mem.
#
max_mem = "#{(node.memory.total.to_i/2) / 1024}m"
default.elasticsearch[:min_mem] = false
default.elasticsearch[:max_mem] = max_mem

# === LIMITS ===
#
default.elasticsearch[:limits]  = {}
default.elasticsearch[:limits][:memlock] = 'unlimited'
default.elasticsearch[:limits][:nofile]  = '64000'
default.elasticsearch[:limits][:max_map_count] = '262144'
# Sets the kernel's swappiness (it's tendancy to swap unused application
# memory). Setting swappiness to false will keep the default kernal value.
default.elasticsearch[:limits][:swappiness] = '1'

# === SETTINGS ===
#
default.elasticsearch[:node_name]      = node.name
default.elasticsearch[:cluster_name]   = ( settings['cluster_name'] || "elasticsearch" rescue "elasticsearch" )
default.elasticsearch[:index_shards]   = "5"
default.elasticsearch[:index_replicas] = "1"

# === PERSISTENCE ===
#
default.elasticsearch[:gateway][:type] = nil
