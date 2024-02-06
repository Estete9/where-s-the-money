class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :activities

  validates :name, presence: true
  validates :icon, presence: true

  def total_amount
    total_amount = 0
    activities.each do |activity|
      total_amount += activity.amount
    end
    total_amount
  end
end
