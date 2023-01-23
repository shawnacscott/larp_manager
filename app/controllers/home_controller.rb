class HomeController < ApplicationController
  def new
    render plain: "Hello, world"
  end

  def dashboard
    @events = Event.all
    @characters = current_user.characters
  end
end
