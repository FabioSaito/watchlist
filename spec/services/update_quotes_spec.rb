require 'rails_helper'

RSpec.describe UpdateQuotes do
  fixtures :all
  let(:assets) { Asset.where(currency: 'BRL').pluck(:symbol) }
  let(:watchlist) { WalletItem.includes(:asset).pluck(:symbol) }
  let(:not_watchlist) { assets - watchlist }

  context 'when asset belongs to watchlist' do
    it 'adds to high priority queue' do
      watchlist.each do |symbol|
        expect(UpdateStockQuoteJob).to receive(:high_priority).with(symbol)
      end

      UpdateQuotes.call
    end
  end

  context 'when asset does not belong to watchlist' do
    it 'adds to default priority queue' do
      not_watchlist.each do |symbol|
        expect(UpdateStockQuoteJob).to receive(:low_priority).with(symbol)
      end

      UpdateQuotes.call
    end
  end
end
