require 'rails_helper'

RSpec.describe StatusInvestScraper do
  describe '#call' do
    describe 'when ticker is valid' do
      it 'returns the stock price' do
        VCR.use_cassette('stock_price') do
          expect(described_class.call('PETR4')).to eq(3410)
        end 
      end
    end

    describe 'when ticker is invalid' do
      it 'raises an error' do
        VCR.use_cassette('stock_price_invalid') do
          expect { StatusInvestScraper.call('3XXXX3') }.to raise_error('Ticker not found')
        end
      end
    end
  end
end
