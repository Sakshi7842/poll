class PollController < ApplicationController
  before_action :authenticate_user!

	def index
		@questions = Question.all
	end

	def submitt
    answer = Answer.find(params[:answer_id])
    question_id = answer.question.id
    
    unless current_user.user_questions.exists?(user_id: current_user.id, question_id: question_id)
       UserQuestion.create({ user_id: current_user.id, question_id: question_id})
       answer.update(total: answer.total + 1)
    end
    redirect_to poll_path
	end
end
