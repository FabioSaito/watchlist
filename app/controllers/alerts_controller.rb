class AlertsController < ApplicationController
  before_action :authenticate_user!

  def index
    assets_id = current_user.wallet.items.pluck(:asset_id)
    @alerts = GetAlerts.call(assets_id)
  end
end
