class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :activities

  validates :name, presence: true
  validates :icon, presence: true

  def total_amount
    # TODO calculate total amount from all transactions related to this category
    "$25"
  end
end
