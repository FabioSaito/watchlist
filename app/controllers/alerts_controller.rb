class AlertsController < ApplicationController
  before_action :authenticate_user!

  def index
    current_symbols = current_user.wallet.items.includes(:asset).map{ |item| item.asset.symbol }
    @alerts = Alert.with_errors(false).containing_symbols(current_symbols).latest.limit(30)
    @alerts_errors = Alert.with_errors(true).latest.limit(30)
  end
end
