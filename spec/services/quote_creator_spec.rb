require 'rails_helper'

RSpec.describe QuoteCreator do
  describe '#call' do
    describe 'when ticker is valid' do
      it 'creates a new quote' do
        allow(StatusInvestScraper).to receive(:call).and_return(1000)
        expect { QuoteCreator.call('PETR4') }.to change(Quote, :count).by(1)
      end
    end
    describe 'when ticker is invalid' do
      it 'raises an error' do
        allow(StatusInvestScraper).to receive(:call).and_raise('Ticker not found')
        expect { QuoteCreator.call('3XXXX3') }.to raise_error('Ticker not found') .and change(Quote, :count).by(0)
      end
    end
  end
end
