module ZookeeperStat
  class Stat
    attr_reader :version, :exists
    def initialize(val)
      @exists = !!val
      @czxid, @mzxid, @ctime, @mtime, @version, @cversion, @aversion,
          @ephemeralOwner, @dataLength, @numChildren, @pzxid = val if val.is_a?(Array)
      val.each { |k,v| instance_variable_set "@#{k}", v } if val.is_a?(Hash)
      raise ArgumentError unless (val.is_a?(Hash) or val.is_a?(Array) or val == nil)
    end
  end
end
