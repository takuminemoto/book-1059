# frozen_string_literal: true

class AddExplanationToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :explanation, :text
  end
end
