class UpdateQuotes
  private_class_method :new

  def self.call
    watchlists = WalletItem.all.pluck(:asset_id)
    Asset.where(currency: 'BRL').each do |asset|
      watchlists.include?(asset.id) ? UpdateStockQuoteJob.high_priority(asset.symbol) : UpdateStockQuoteJob.low_priority(asset.symbol)
    end
  end
end
