class ZabbixApi
  class Items < Basic

    # gets the last value of a particular item - pass in host id and key
    def get_item_lastvalue(hostid, key)
      lastval = ''
      result = @client.api_request(:method => "#{method_name}.get", :params => { :output => "extend", :hostids => hostid, :search => { :key_ => key } } )
      result.each do |item|
        item.each do |name,val|
          if name == 'lastvalue'
            lastval = val
          end
        end
      end
      lastval
    end

    # get an item id from search
    def get_item_id(hostid, key)
      id = ''
      result = @client.api_request(:method => "#{method_name}.get", :params => { :output => "extend", :hostids => hostid, :search => { :key_ => key } } )
      result.each do |item|
        item.each do |name,val|
          if name == 'itemid'
            id = val
          end
        end
      end
      id
    end

    # get the value of an item by parameter name
    def get_item_value_byname(hostid, key, param)
      vals = ''
      result = @client.api_request(:method => "#{method_name}.get", :params => { :output => "extend", :hostids => hostid, :search => { :key_ => key } } )
      result.each do |item|
        item.each do |name,val|
          if name == param
            vals = val
          end
        end
      end
      vals
    end

    def array_flag
      true
    end

    def method_name
      "item"
    end

    def indentify
      "name"
    end

    def default_options 
      {
        :name => nil,
        :key_ => nil,
        :hostid => nil,
        :delay => 60,
        :history => 60,
        :status => 0,
        :type => 7,
        :snmp_community => '',
        :snmp_oid => '',
        :value_type => 3,
        :data_type => 0,
        :trapper_hosts => 'localhost',
        :snmp_port => 161,
        :units => '',
        :multiplier => 0,
        :delta => 0,
        :snmpv3_securityname => '',
        :snmpv3_securitylevel => 0,
        :snmpv3_authpassphrase => '',
        :snmpv3_privpassphrase => '',
        :formula => 0,
        :trends => 365,
        :logtimefmt => '',
        :valuemapid => 0,
        :delay_flex => '',
        :authtype => 0,
        :username => '',
        :password => '',
        :publickey => '',
        :privatekey => '',
        :params => '',
        :ipmi_sensor => ''
      }
    end

  end
end
