class RecordFeedingHandler < ApplicationHandler
  def call
    user.events.create(kind: "feeding")
    plain_text("Feeding recorded")
  end
end