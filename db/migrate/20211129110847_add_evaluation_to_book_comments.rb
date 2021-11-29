class AddEvaluationToBookComments < ActiveRecord::Migration[5.2]
  def change
    add_column :book_comments, :evaluation, :float
  end
end
