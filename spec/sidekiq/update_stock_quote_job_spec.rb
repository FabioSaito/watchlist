require 'rails_helper'

RSpec.describe UpdateStockQuoteJob, type: :job do
  context 'when UpdateStockQuoteJob is performed' do

  end
    it 'increases queue by 1' do
      expect { UpdateStockQuoteJob.perform_async('PETR4') }.to change(UpdateStockQuoteJob.jobs, :size).by(1)
    end

    it 'add asset to queue' do
      UpdateStockQuoteJob.perform_async('PETR4')
      expect(UpdateStockQuoteJob).to have_enqueued_sidekiq_job('PETR4')
    end
  end
end
