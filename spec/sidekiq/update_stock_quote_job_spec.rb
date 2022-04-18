require 'rails_helper'

RSpec.describe UpdateStockQuoteJob, type: :job do

  describe '.high_priority' do
    before { UpdateStockQuoteJob.high_priority('PETR3') }

    it 'includes job to queue with expected parameters' do
      expect(UpdateStockQuoteJob).to have_enqueued_sidekiq_job('PETR3')
    end

    it 'adds job to critical queue' do
      expect(UpdateStockQuoteJob.jobs[0]["queue"]).to eq("critical")
    end
  end

  describe '.low_priority' do
    before { UpdateStockQuoteJob.low_priority('PETR4') }

    it 'includes job to queue with expected parameters' do
      expect(UpdateStockQuoteJob).to have_enqueued_sidekiq_job('PETR4')
    end

    it 'adds job to default queue' do
      expect(UpdateStockQuoteJob.jobs[0]["queue"]).to eq("default")
    end
  end
end
