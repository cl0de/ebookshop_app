class Order < ActiveRecord::Base
  belongs_to :cart
  # These attributes won't be stored
  attr_accessor :card_number, :card_verification
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :card_verification, presence: true
  validates :card_number, presence: true
  validates :card_type, presence: true
  #validates :card_expires_on.month, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }
  #validates :card_expires_on.year, presence: true
  #validates :amount, presence: true, numericality: { greater_than: 0 }
  #validate_on_create :validate_card
  before_create :validate_card
  
  

 private
  
  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add :base, :message => "The credit card information you provided is not valid.  Please double check the information you provided and then try again."
      end
    end
  end

  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
        type:                card_type,
        number:              card_number,
        verification_value:  card_verification,
        month:               card_expires_on.month,
        year:                card_expires_on.year,
        first_name:          first_name,
        last_name:           last_name
    )
  end

end
