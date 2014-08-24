class AddImgToProduct < ActiveRecord::Migration
  def change
    add_column :products, :image, :binary, :limit => 50.megabyte
  end
end
