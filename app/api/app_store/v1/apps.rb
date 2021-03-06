require 'grape/rabl'
module AppStore
  module V1
    class Apps < Grape::API
      version 'v1'
      format :json
      formatter :json, Grape::Formatter::Rabl

      before do

      end

      desc "Apps"
      params do
       requires :name, type: String, allow_blank: false
      end

      # => Search API
      get :app, :rabl => "api/v1/apps/app.json" do
        begin
          @app = App.find_by(name: params[:name].downcase)
          @app = App.find_by(name: "default") if @app.blank?
          @selected_add = @app.adds.active_adds.random_add if @app.present?
          error!({ error: "Please set default app with name: 'default'."}) if @app.blank?

        rescue Timeout::Error => e
          error!({ error: "Server Busy"}, 500)
        rescue Exception => e
          error!({ error: "Internal Server Error" }, 500)
        end
      end

    end
  end
end
