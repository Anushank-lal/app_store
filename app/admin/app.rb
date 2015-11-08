ActiveAdmin.register App do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
permit_params :name, :status, :url, :image

controller do
  def site_params
    params.require(:app).permit(App.attribute_names.map(&:to_sym))
  end
end

end
