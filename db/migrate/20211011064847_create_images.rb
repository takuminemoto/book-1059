# frozen_string_literal: true

class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.text :shop_name
      t.string :image_id
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
