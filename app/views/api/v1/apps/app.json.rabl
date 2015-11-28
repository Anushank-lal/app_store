if @app.status == true
object @app

node(:url) do
@selected_add.url
end

node(:image) do
@selected_add.image
end


else
node(:status) do
false
end
end


attributes :id, :name, :url, :image
