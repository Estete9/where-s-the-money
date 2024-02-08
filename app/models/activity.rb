class Activity < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_and_belongs_to_many :categories

  validates :name, presence: true
  validates :amount, presence: true
  validate :at_least_one_category_selected

  private

  def at_least_one_category_selected
    if category_ids.blank?
      errors.add(:base, "At least one category must be selected") if categories.empty?
    end
  end
end
