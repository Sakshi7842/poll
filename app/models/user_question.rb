class UserQuestion < ApplicationRecord
	belongs_to :question
	belongs_to :user
end
