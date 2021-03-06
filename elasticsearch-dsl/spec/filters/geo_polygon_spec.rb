require 'spec_helper'

describe Elasticsearch::DSL::Search::Filters::GeoPolygon do

  describe '#to_hash' do

    let(:search) do
      described_class.new
    end

    it 'can be converted to a hash' do
      expect(search.to_hash).to eq(geo_polygon: {})
    end
  end

  context 'when options methods are called' do

    let(:search) do
      described_class.new(:foo)
    end

    describe '#points' do

      before do
        search.points('bar')
      end

      it 'applies the option' do
        expect(search.to_hash[:geo_polygon][:foo][:points]).to eq('bar')
      end
    end
  end

  describe '#initialize' do

    context 'when a block is provided' do

      let(:search) do
        described_class.new :foo do
          points 'bar'
        end
      end

      it 'executes the block' do
        expect(search.to_hash).to eq(geo_polygon: { foo: { points: 'bar' } })
      end
    end
  end
end
