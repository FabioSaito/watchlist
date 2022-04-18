class UpdateStockQuoteJob
  include Sidekiq::Job

  sidekiq_options lock: :until_executed, on_conflict: :reject

  def self.high_priority(asset_symbol)
    set(queue: :critical).perform_async(asset_symbol)
  end

  def self.low_priority(asset_symbol)
    set(queue: :default).perform_async(asset_symbol)
  end

  def perform(params)
    QuoteCreator.call(params)
  end
end
