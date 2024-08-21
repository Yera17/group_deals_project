class AddApprovedToSubscriptions < ActiveRecord::Migration[7.1]
  def change
    add_column :subscriptions, :approved, :boolean, default: false
  end
end
