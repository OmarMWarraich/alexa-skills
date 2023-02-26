class DefaultHandler < ApplicationHandler
  def call
    plain_text("Welcome to Baby Tracker. You can say 'record feeding' or 'last feeding'")
  end
end