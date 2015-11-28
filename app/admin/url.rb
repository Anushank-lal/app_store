ActiveAdmin.register Url do
  belongs_to :app
  actions :all#, :except => [:destroy, :create, :new, :edit, :update]
  config.per_page = 20

  # before_filter  do
  #   @site = Site.friendly.find(params[:site_id])
  # end

  # filter :payment_method
  # filter :status
  # filter :created_at

  permit_params :url, :status

  index do
    # column "Phone" do |payment|
    #   payment.user_phone
    # end
    column :id
    column :url
    column :status
    column :created_at
    column :updated_at
    actions
  end

  show do |url|
    attributes_table do
      row :id
      row :url
      row :status
      row :created_at
      row :updated_at
    end
  end

end
