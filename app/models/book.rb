class Book < ActiveRecord::Base
 
      has_and_belongs_to_many :authors
      has_many :cart_items
      before_destroy :ensure_not_referenced_by_any_cart_item 
      
      #default_scope { where(active: true) }
      
      default_scope -> { order(created_at: :desc) }
     
      mount_uploader :picture, PictureUploader
      validate  :picture_size
      validates :title, length: {maximum: 150}
      validates :description, length: { minimum: 2, message: 'book title must be longer than 2 letters' }
      validates :price, numericality: { greater_than_or_equal_to: 0.01 }
      #validates :isbn, format: { with: /[0-9\-xX]{13}/}, uniqueness: true, on: :create
      validates :isbn, presence: true
      #validates :authors, presence: true
      validates :title, :description, :price, presence: true
    
    def self.latest
    		Book.order(:updated_at).last
    end
  
private
  # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
    
    def ensure_not_referenced_by_any_cart_item
      if cart_items.empty?
        return true
      else
        errors.add(:base,'Cart Items present')
        return false
      end
    end
end
