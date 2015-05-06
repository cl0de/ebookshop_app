class Author < ActiveRecord::Base
  
  has_and_belongs_to_many :books
  
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  
  
  def name
  "#{first_name} #{last_name}"
  end
end
