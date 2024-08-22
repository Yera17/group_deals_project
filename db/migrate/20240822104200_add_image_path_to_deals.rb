class AddImagePathToDeals < ActiveRecord::Migration[7.1]
  def change
    add_column :deals, :image_path, :string, default: "https://webcolours.ca/wp-content/uploads/2020/10/webcolours-unknown.png"
  end
end
