class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :title, length: { minimum: 5 }

  validates :body, presence: true
  validates :body, length: { minimum: 100 }
end
