class GetAlerts
  private_class_method :new

  def self.call(assets_id)
    current_user_assets = Asset.where(id: assets_id).pluck(:symbol)
    alert_list = []

    current_user_assets.each do |symbol|
      alert_list << Alert.where("message LIKE ?", "%#{symbol}%").pluck(:message)
    end
    alert_list.flatten
  end
end
