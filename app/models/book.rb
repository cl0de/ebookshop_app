class Book < ActiveRecord::Base
 
   has_and_belongs_to_many :authors
   mount_uploader :picture, PictureUploader
  
  validates :title, presence: true, length: {maximum: 150}
  
  validates :description, presence: true, length: { maximum: 255}
  
  validates :price, numericality: true
  
  validates :isbn, format: { with: /[0-9\-xX]{13}/}, uniqueness: true
  
  validates :authors, presence: true
  

  
  #has_many :author_books
  #has_many :authors, :through => :author_books
end
