class User < ApplicationRecord
 # Include default devise modules. Others available are:
 # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

 attachment :image, destroy: false

 has_many :books, dependent: :destroy
 has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
	 
 validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
 validates :introduction, length: { maximum: 50 }
 
 def self.search_for(content, method)
  if method == 'perfect'
    User.where(name: content)
  elsif method == 'forward'
    User.where('name LIKE ?', content + '%')
  elsif method == 'backward'
    User.where('name LIKE ?', '%' + content)
  else
    User.where('name LIKE ?', '%' + content + '%')
  end
 end
end
