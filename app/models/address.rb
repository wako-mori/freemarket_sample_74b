class Address < ApplicationRecord
  belongs_to :user
  validates :post_code, :prefectures, :city, :block,  presence: true
end
