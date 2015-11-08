class API < Grape::API
  #use ::WineBouncer::OAuth2
  # error_formatter :json, API::ErrorFormatter

  before do
    header['Access-Control-Allow-Origin'] = '*'
    header['Access-Control-Request-Method'] = '*'
  end


  helpers do
    # def current_token
    #   doorkeeper_access_token
    # end

    # def current_user
    #   resource_owner
    # end

    # def current_scopes
    #   current_token.scopes
    # end
  end

  rescue_from :all do |e|
    # Notify external service of the error
    #Airbrake.notify(e)  if Rails.env.production? || Rails.env.staging?
    eclass = e.class.to_s
    message = "OAuth error: #{e.to_s}" if eclass.match('WineBouncer::Errors')
    message = "NotAuthorized error" if eclass.match('Pundit::NotAuthorizedError')
    status = case
    when eclass.match('OAuthUnauthorizedError')
      401
    when eclass.match('OAuthForbiddenError')
      403
    when eclass.match('NotAuthorizedError')
      403
    when eclass.match('RecordNotFound'), e.message.match(/unable to find/i).present?
      404
    else
      (e.respond_to? :status) && e.status || 500
    end
    opts = { error: "#{message || e.message}" }
    # opts[:trace] = e.backtrace[0,10] unless Rails.env.production?
    Rack::Response.new(opts.to_json, status, {
      'Content-Type' => "application/json",
      'Access-Control-Allow-Origin' => '*',
      'Access-Control-Request-Method' => '*',
    }).finish
  end

  prefix 'api'


  mount AppStore::V1::Apps
end
