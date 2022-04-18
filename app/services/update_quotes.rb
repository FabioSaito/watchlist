class UpdateQuotes
  private_class_method :new

  class << self
    def call
      watchlist = WalletItem.pluck(:asset_id)

      Asset.where(currency: 'BRL').each do |asset|
        UpdateStockQuoteJob.send(
          priority_by_asset(watchlist, asset.id),
          asset.symbol
        )
      end
    end

    private

    def priority_by_asset(watchlist, asset_id)
      watchlist.include?(asset_id) ? :high_priority : :low_priority
    end
  end
end
