class HomeController < ApplicationController

  def index
  	@questions = current_user&.questions || []
  end
end
