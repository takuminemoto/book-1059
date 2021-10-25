# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user_id, presence: true
  validates :book_id, presence: true
end
