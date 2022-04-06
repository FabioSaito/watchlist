class QuoteCreator
  private_class_method :new

  def self.call(ticker)
    quote_value = StatusInvestScraper.call(ticker)
    ticker_id = Asset.find_or_create_by!(symbol: ticker.upcase, currency: 'BRL').id

    Quote.transaction do
      Quote.where(asset_id: ticker_id).update_all(current: false)
      Quote.create!(price: quote_value, current: true, asset_id: ticker_id)
    end
  end
end
