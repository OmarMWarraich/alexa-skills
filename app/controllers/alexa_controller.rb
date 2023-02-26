class AlexaController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    render json: plain_text("Hello, world!")
  end

  def plain_text(message)
    {
        version: "1.0",
        sessionAttributes: {},
        response: {
            shouldEndSession: false,
            outputSpeech: {
                type: "PlainText",
                text: message
            }
        }
    }
  end
end