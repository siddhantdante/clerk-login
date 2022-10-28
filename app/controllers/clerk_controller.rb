require 'current_user'
require 'uri'
require 'net/http'

class ClerkController < ApplicationController
  layout :false
  include CurrentUser

  skip_before_action :verify_authenticity_token

  def index
    # userId = JSON.parse(params[:data_value], { :symbolize_names => true })[:status]
    # cookies[:_t] = { :value => '0' }
    # cookies[:_forum_session] = { :value => '0' }

    # user_id = params[:id]
    # p user_id
    # unless user_id.nil? || user_id == 0
    #
    # end
    p "success"
    user_id = current_user[:id]
    url = URI("http://localhost:4200/admin/users/" + user_id.to_s + "/log_out.json")

    http = Net::HTTP.new(url.host, url.port);
    request = Net::HTTP::Post.new(url)
    request["Api-Key"] = "91912452c12c4a548e47c39180cd6bcc451cbfc83f11e842b93260d0d4e2da24"
    request["Api-Username"] = "system"

    response = http.request(request)
    puts response.read_body

  end
end


