class UpdateQuotes
  private_class_method :new

  def self.call
    Asset.where(currency: 'BRL').each do |asset|
      UpdateStockQuoteJob.perform_async(asset.symbol)
    end
  end
end
