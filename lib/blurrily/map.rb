require 'blurrily/map_ext'

module Blurrily
  class Map < RawMap

    def put(needle, reference, weight=nil)
      weight ||= 0
      needle = normalize_string needle
      @clean_path = nil
      super(needle, reference, weight)
    end

    def find(needle, limit=10)
      needle = normalize_string needle
      super(needle, limit)
    end

    def delete(*args)
      @clean_path = nil
      super(*args)
    end

    def save(path)
      return if @clean_path == path
      super(path)
      @clean_path = path
      nil
    end

    def self.load(path)
      super(path).tap do |map|
        map.instance_variable_set :@clean_path, path
      end
    end

    private

    def normalize_string(needle)
      result = needle.downcase
      unless result =~ /^([a-z ])+$/
        result = result.unicode_normalize(:nfd).gsub(/[^\x00-\x7F]/,'').to_s.gsub(/[^a-z]/,' ')
      end
      result.gsub(/\s+/,' ').strip
    end
  end
end
