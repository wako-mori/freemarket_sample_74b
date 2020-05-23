class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :post_code,       presence: true, numericality: { only_integer: true }, length: { is: 7 }
  validates :prefectures,     presence: true
  validates :city,            presence: true
  validates :block,           presence: true
  validates :phone_number,    numericality: { only_integer: true }
end