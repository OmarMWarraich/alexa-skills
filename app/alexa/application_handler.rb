class ApplicationHandler
  include ActionView::Helpers::DateHelper

  attr_reader :params

  def initialize(params)
    @params = params
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

  def ssml(message)
    {
        version: "1.0",
        sessionAttributes: {},
        response: {
            shouldEndSession: false,
            outputSpeech: {
                type: "SSML",
                ssml: message
            }
        }
    }
  end


  def user
    User.find_or_create_by(alexa_Id: params.dig(:session, :user, :userId))
  end
end