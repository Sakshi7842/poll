class Question < ApplicationRecord
	enum status: [ :active, :inactive ]

	has_many :answers, inverse_of: :question, dependent: :destroy
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
  validates :title, presence: true
end
