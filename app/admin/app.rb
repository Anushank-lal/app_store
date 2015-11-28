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
permit_params :name, :status

controller do
  def app_params
    params.require(:app).permit(App.attribute_names.map(&:to_sym))
  end
end

  begin
    sidebar "Details", only: [:show] do
      ul do
        li link_to("Adds", admin_app_adds_path(app))
        #li link_to("Images", admin_app_images_path(app))

      end
    end
  end

end
