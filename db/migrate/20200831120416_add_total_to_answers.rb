class AddTotalToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :total, :integer, default: 0
  end
end
