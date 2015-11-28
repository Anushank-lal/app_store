class RemoveUrlFromApp < ActiveRecord::Migration
  def change
    remove_column :apps, :url, :string
    remove_column :apps, :image, :string
  end
end
