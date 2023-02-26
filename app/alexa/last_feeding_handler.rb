class LastFeedingHandler < ApplicationHandler
  def call
    event = user.events.where(kind: "feeding").order(created_at: :desc).first
    message = if event
                <<~MESSAGE
                  <speak>
                  I want to tell you a secret.
                      <amazon:effect name="whispered">I am not a real human.</amazon:effect>.
                  Can you believe it?
                  </speak>
                MESSAGE

                #"Last feeding was at #{time_ago_in_words(event.created_at)} ago"
                else
                    "No feedings have been recorded"
                end
    ssml(message)
    end
end