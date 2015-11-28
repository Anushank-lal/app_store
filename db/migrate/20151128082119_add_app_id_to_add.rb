class AddAppIdToAdd < ActiveRecord::Migration
  def change
    add_column :adds, :app_id, :integer
  end
end
