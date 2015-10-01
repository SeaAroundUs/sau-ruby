require_relative '../spec_helper'

module SAU
  describe Region do
    describe :get_detail do
      it 'gets region details' do
        region = Region.new({ region: TEST_REGION, id: TEST_REGION_ID, foo: 'baz' })
        stub = stub_request(:get, "#{BASE_URL}#{TEST_REGION}/#{TEST_REGION_ID}").
            to_return(body: { data: TEST_REGION_DETAIL }.to_json)
        region = region.get_detail
        expect(stub).to have_been_requested
        expect(region.instance_variable_get(:@props)).to eq TEST_REGION_DETAIL.merge({ region: TEST_REGION })
      end
    end

    describe :get_data do
      it 'gets region data for a set of params' do
        url = "#{BASE_URL}#{TEST_REGION}/#{TEST_DATA_PARAMS[:measure]}" +
          "/#{TEST_DATA_PARAMS[:dimension]}/?region_id=#{TEST_REGION_ID}&" +
          "limit=#{TEST_DATA_PARAMS[:limit]}&sciname=#{TEST_DATA_PARAMS[:sciname]}"
        region = Region.new({ region: TEST_REGION, id: TEST_REGION_ID })
        stub = stub_request(:get, url).
            to_return(body: { data: 'testdata' }.to_json)
        region = region.get_data(TEST_DATA_PARAMS)
        expect(stub).to have_been_requested
        expect(region.instance_variable_get(:@props)[:data]).to eq 'testdata'
      end
    end

    describe :method_missing do
      let(:region) { Region.new(foo: 'bar') }

      it 'returns a value if the property exists' do
        expect(region.foo).to eq 'bar'
      end

      it 'assigns a new value if the method ends with =' do
        region.foo = 'baz'
        expect(region.foo).to eq 'baz'
      end

      it 'raises a NoMethodError error if the property does not exist' do
        expect { region.bar }.to raise_error NoMethodError
      end
    end
  end
end
