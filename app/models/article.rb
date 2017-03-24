class Article < ApplicationRecord
  validates :title, presence: :true
  validates :publication_date, presence: :true
  validates :source, presence: :true
end
