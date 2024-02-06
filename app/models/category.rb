class Category < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :icon, presence: true

  def total_amount
    # TODO calculate total amount from all transactions related to this category
    "$25"
  end
end
