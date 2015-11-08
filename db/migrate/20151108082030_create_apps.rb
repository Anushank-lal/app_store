class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.boolean :status, default: true
      t.string :url
      t.string :image

      t.timestamps null: false
    end
  end
end
