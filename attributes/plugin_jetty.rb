default.elasticsearch[:plugin][:jetty][:version] = "0.19.3"
default.elasticsearch[:plugin][:jetty][:name] = "jetty"
default.elasticsearch[:plugin][:jetty][:url] = "sonian/elasticsearch-jetty/#{node.elasticsearch[:version]}"
default.elasticsearch[:plugin][:jetty][:http] = false
default.elasticsearch[:plugin][:jetty][:https] = true