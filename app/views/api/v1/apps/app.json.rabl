if @app.status == true
object @app
else
node(:status) do
false
end
end


attributes :id, :name, :image
