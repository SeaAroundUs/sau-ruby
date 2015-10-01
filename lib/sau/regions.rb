module SAU
  class Regions
    attr_reader :regions

    def initialize(regions)
      @regions = regions
    end

    def method_missing(meth, *args)
      super(meth, args) unless meth.to_s =~ /^get_by_(\w+)$/
      value, prop = args.first, $1
      @regions.find { |region| region.send(prop.to_sym) == value }
    end
  end
end
