class CreateAdds < ActiveRecord::Migration
  def change
    create_table :adds do |t|
      t.string :url
      t.string :image
      t.boolean :status, default: false

      t.timestamps null: false
    end
  end
end
