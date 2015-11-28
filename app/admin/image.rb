ActiveAdmin.register Image do
  belongs_to :app
  actions :all#, :except => [:destroy, :create, :new, :edit, :update]
  config.per_page = 20

  permit_params :image, :status

  index do
    column :id
    column :image
    column :status
    column :created_at
    actions
  end

  show do |image|
    attributes_table do
      row :id
      row :image
      row :status
      row :created_at
      row :updated_at
    end
  end

end
