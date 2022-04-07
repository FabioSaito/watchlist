class UpdateQuotes
  private_class_method :new

  def self.call
    watchlists = WalletItem.all.pluck(:asset_id)
    Asset.where(currency: 'BRL').each do |asset|
      queue_type = watchlists.include?(asset.id) ? :critical : :default
      UpdateStockQuoteJob.set(queue: queue_type).perform_async(asset.symbol)
    end
  end
end
