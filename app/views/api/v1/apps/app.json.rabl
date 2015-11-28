if @app.status == true
object @app

node(:urls) do
@app.urls.active_urls.map{|x| x.url}
end

node(:images) do
@app.images.active_images.map{|x| x.image}
end

else
node(:status) do
false
end
end


attributes :id, :name, :url, :image
