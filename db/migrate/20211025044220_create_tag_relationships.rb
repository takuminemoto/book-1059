# frozen_string_literal: true

class CreateTagRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_relationships do |t|
      t.references :book, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
