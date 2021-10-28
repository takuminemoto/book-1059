# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  def user_exist?(user)
    favorite_users.include?(user)
  end

  def self.search_for(content, method)
    case method
    when 'perfect'
      Book.where(title: content)
    when 'forward'
      Book.where('title LIKE ?', "#{content}%")
    when 'backward'
      Book.where('title LIKE ?', "%#{content}")
    else
      Book.where('title LIKE ?', "%#{content}%")
    end
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
