class Article < ApplicationRecord
  mount_uploader :file, ArticleUploader
  validates :title, presence: :true
  validates :file, presence: :true
  validates :folder, presence: :true
  validates :abstract, presence: :true
end
