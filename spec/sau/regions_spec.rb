require_relative '../spec_helper'

module SAU
  describe Regions do
    describe :method_missing do
      it 'returns regions by field if that field exists' do
        test_region = Object.new
        expect(test_region).to receive(:foo).and_return('bar')
        regions = Regions.new([test_region])
        expect(regions.get_by_foo('bar')).to be test_region
      end

      it 'raises a NoMethodError error if the field does not exist' do
        test_region = Object.new
        regions = Regions.new([test_region])
        expect { regions.get_by_foo('bar') }.to raise_error NoMethodError
      end
    end
  end
end
