  class ApplicationController < ActionController::Base
    before_action :basic_auth
  
    private
    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == '35821' && password == '35821'
      end
    end
  end


