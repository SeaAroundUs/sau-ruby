require 'bundler/setup'
Bundler.require(:default)
require_relative 'sau/regions'
require_relative 'sau/region'

module SAU
  BASE_URL = 'http://api.seaaroundus.org/api/v1/'

  class << self
    def get_regions(region_name)
      regions = call_api("#{region_name}/?nospatial=true")
      Regions.new(regions.map { |region| region[:region] = region_name; Region.new(region) })
    end

    def get_region_detail(region_name, region_id)
      Region.new(region: region_name, id: region_id).get_detail
    end

    def get_region_data(region_name, region_id, params)
      Region.new(region: region_name, id: region_id).get_data(params)
    end

    def call_api(url)
      response = RestClient.get(BASE_URL + url)
      raise 'Error: ' + response.to_s unless response.code == 200
      JSON.parse(response.to_s, symbolize_names: true)[:data]
    end
  end
end
