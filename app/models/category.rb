class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :activities

  validates :name, presence: true
  validates :icon, presence: true

  def total_amount
    # TODO calculate total amount from all transactions related to this category
    # total_amount = 0
    # activities.each do |activity|
    #   total_amount += activity.amount
    # end
    # total_amount
    "$25"
  end
end
