class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :post_code, :prefectures, :city, :block,  presence: true
end
