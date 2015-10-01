module SAU
  class Region
    def initialize(props)
      @props = props
    end

    def get_detail
      @props.merge!(SAU.call_api("#{region}/#{id}"))
      self
    end

    def get_data(params)
      url = "#{region}/#{params[:measure]}/#{params[:dimension]}/?region_id=#{id}&"
      url += params.select { |param| !%i(measure dimension).include?(param) }.map { |k,v| "#{k}=#{v}" }.join('&')
      @props[:data] = SAU.call_api(url)
      self
    end

    def method_missing(meth, *args)
      return @props[meth] if @props.include?(meth)
      super(meth, args) unless meth.to_s =~ /=$/
      @props[meth.to_s[0...-1].to_sym] = args.first
    end
  end
end
