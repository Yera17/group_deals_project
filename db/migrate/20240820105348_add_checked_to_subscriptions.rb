class AddCheckedToSubscriptions < ActiveRecord::Migration[7.1]
  def change
    add_column :subscriptions, :checked, :boolean, default: false
  end
end
