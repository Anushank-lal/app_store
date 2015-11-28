class AddAppIdToUrl < ActiveRecord::Migration
  def change
    add_column :urls, :app_id, :integer
  end
end
