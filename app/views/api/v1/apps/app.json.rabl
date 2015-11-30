object @app

node(:url) do
@selected_add.url if @selected_add.present?
end

node(:image) do
@selected_add.image if @selected_add.present?
end


attributes :id, :name, :url, :image, :status
