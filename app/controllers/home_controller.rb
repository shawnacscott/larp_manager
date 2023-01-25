class HomeController < ApplicationController
  def new
    render plain: "Hello, world"
  end

  def dashboard
    @events = Event.all
    # TODO: add back once user isn't directly connected
    # @characters = current_user.characters
  end
end
