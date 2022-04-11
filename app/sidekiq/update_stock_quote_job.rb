class UpdateStockQuoteJob
  include Sidekiq::Job
  sidekiq_options retry: 5

  sidekiq_retries_exhausted do |msg|
    Alert.create!(message: "[ERROR] Ticker: #{msg['args'][0]} could not be fetched!")
  end

  def perform(params)
    QuoteCreator.call(params)
  end
end
