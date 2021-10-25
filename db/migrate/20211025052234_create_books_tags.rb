# frozen_string_literal: true

class CreateBooksTags < ActiveRecord::Migration[5.2]
  def change
    create_table :books_tags, &:timestamps
  end
end
