class Book < ActiveRecord::Base
 
      has_and_belongs_to_many :authors
      has_many :cart_items
      has_many :carts, :through => :cart_items  
      #default_scope { where(active: true) }
      
     default_scope -> { order(created_at: :desc) }
     
     mount_uploader :picture, PictureUploader
     validate  :picture_size
  
    validates :title, presence: true, length: {maximum: 150}
    
    validates :description, presence: true, length: { maximum: 255}
    
    validates :price, numericality: true
    
    validates :isbn, format: { with: /[0-9\-xX]{13}/}, uniqueness: true, on: :create
  
  #validates :authors, presence: true
private
  # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end
