class RemoveRefenceFromAlerts < ActiveRecord::Migration[7.0]
  def change
    remove_reference :alerts, :quote, foreign_key: true, index: false
  end
end
