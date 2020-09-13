class PollController < ApplicationController
  before_action :authenticate_user!

	def index
		@questions = Question.all
	end

	def submitt
    answer = Answer.find(params[:answer_id])
    question_id = answer.question.id
    is_updated = false
    unless current_user.user_questions.exists?(user_id: current_user.id, question_id: question_id)
      UserQuestion.create({ user_id: current_user.id, question_id: question_id})
      is_updated = answer.update(total: answer.total + 1)
    end
    @questions = Question.all
    respond_to do |format|
      if is_updated
        format.html { redirect_to poll_path, notice: 'Poll was successfully submitted.' }
      else
        flash.now[:alert] = 'You have already submitted this poll.'
        format.html { render :index }
      end
    end
  end
end
