class AlexaController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    handler = "#{intent.camelize}Handler".constantize.new(params) rescue DefaultHandler
    render json: handler.call
  end

  def intent
    params.dig(:request, :intent, :name) || "Default"                  
  end

end