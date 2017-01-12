class Contact < ActiveRecord::Base
  belongs_to :type
  has_one :address
  has_many :phones
  
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true
  
  validates :nome, length: { in: 3..60 }, presence: true
  validates :email, length: { maximum: 40}, presence: true
  
end
