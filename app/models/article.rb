class Article < ApplicationRecord
  mount_uploader :file, ArticleUploader
  validates :title, presence: :true
  validates :publication_date, presence: :true
  validates :file, presence: :true
  validates :folder, presence: :true
end
