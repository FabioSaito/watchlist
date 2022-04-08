class Quote < ApplicationRecord
  belongs_to :asset

  validates :price, presence: true
end
