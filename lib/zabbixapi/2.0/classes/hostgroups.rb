class ZabbixApi
  class HostGroups < Basic

    # returns an array of host ids that are a members of hostgroup
		def get_ids_by_hostgroup(groupid)
      ids = []
      result = @client.api_request(:method => "#{method_name}.get", :params => {:groupids => groupid, :selectHosts => "refer"})
      result.each do |hostgrp|
				hostgrp['hosts'].each do |host|
      		id  = host['hostid']
      		ids.push(id)
				end
      end
      ids
    end

    def array_flag
      true
    end

    def method_name
      "hostgroup"
    end

    def indentify
      "name"
    end

    def key
      "groupid"
    end
  end
end
