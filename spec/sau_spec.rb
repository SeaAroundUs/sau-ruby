require_relative 'spec_helper'

module SAU
  describe :get_regions do
    it 'gets the regions of a given type' do
      stub_request(:get, "#{BASE_URL}#{TEST_REGION}/?nospatial=true").
          to_return(body: { data: [ TEST_REGION_DETAIL ]}.to_json)
      regions = SAU.get_regions(TEST_REGION)
      expect(regions).to be_instance_of Regions
      expect(regions.regions.first).to be_instance_of Region
      expect(regions.regions.first.region).to eq TEST_REGION
    end
  end

  describe :get_region_detail do
    it 'gets the region detail for a specified type and id' do
      expect_any_instance_of(Region).to receive(:get_detail)
      SAU.get_region_detail(TEST_REGION, TEST_REGION_ID)
    end
  end

  describe :get_region_data do
    it 'gets the region data for a specified type and id with params' do
      expect_any_instance_of(Region).to receive(:get_data)
      SAU.get_region_data(TEST_REGION, TEST_REGION_ID, TEST_DATA_PARAMS)
    end
  end

  describe :call_api do
    it 'calls the API' do
      stub = stub_request(:get, "#{BASE_URL}foobar").to_return(body: { data: 'success' }.to_json)
      expect(SAU.call_api('foobar')).to eq 'success'
      expect(stub).to have_been_requested
    end

    it 'raises an error for non 200 status' do
      stub = stub_request(:get, "#{BASE_URL}foobar").to_return(status: 500, body: 'error')
      expect { SAU.call_api('foobar') }.to raise_error(RestClient::InternalServerError)
      expect(stub).to have_been_requested
    end
  end
end
