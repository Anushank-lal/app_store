class AddAppIdToImage < ActiveRecord::Migration
  def change
    add_column :images, :app_id, :integer
  end
end
