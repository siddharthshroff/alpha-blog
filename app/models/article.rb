class Article < ActiveRecord::Base
  validates :title, presence: true, length: { in: 3..10 }
  validates :description, presence: true, length: { in: 10..300 }
end