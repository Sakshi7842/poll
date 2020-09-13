class PollController < ApplicationController
  before_action :authenticate_user!

	def index
		@questions = Question.all
	end

	def submitt
    answer = Answer.find(params[:answer_id])
    question_id = answer.question.id
    is_answered = false
    unless current_user.user_questions.exists?(user_id: current_user.id, question_id: question_id)
      is_answered = UserQuestion.create({ user_id: current_user.id, question_id: question_id})
       answer.update(total: answer.total + 1)
    end

    @questions = Question.all

    respond_to do |format|
      if is_answered
        format.html { redirect_to poll_path, notice: 'You have submitted poll of this question.' }
      else
        flash.now[:alert] = 'You have already polled.'
        format.html { render :index }
      end
    end
	end

end
