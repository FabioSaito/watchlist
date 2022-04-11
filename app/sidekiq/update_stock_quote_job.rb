class UpdateStockQuoteJob
  include Sidekiq::Job

  def perform(params)
    QuoteCreator.call(params)
  end
end
