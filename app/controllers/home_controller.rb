class HomeController < ApplicationController
  def index
  	if admin_signed_in?
  		@questions = Question.all
  	else
  		@questions = current_user&.questions || []
  	end
  	
  end
end
