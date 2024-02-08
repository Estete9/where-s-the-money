require 'rails_helper'

RSpec.feature 'Activities', type: :feature do
  let(:user) { create(:user) }
  let(:category) { create(:category, user: user) }

  scenario "User views activities list for a category" do
    activity1 = create(:activity, author: user, categories: [category])
    activity2 = create(:activity, author: user, categories: [category])

    login_as(user)

    visit category_activities_path(category_id: category.id)

    expect(page).to have_selector('.activity-item', count: 2)
    expect(page).to have_content(activity1.name)
    expect(page).to have_content(activity1.amount)
    expect(page).to have_content(activity2.name)
    expect(page).to have_content(activity2.amount)
  end

  scenario "Users sees an empty list message" do
    login_as(user)

    visit category_activities_path(category_id: category.id)

    expect(page).to have_content("Empty list, new Activities will show here...")
  end

  scenario "User navigates to add a new activity" do
    login_as(user)

    visit category_activities_path(category_id: category.id)

    click_link "Add a New Activity"

    expect(page).to have_current_path(new_category_activity_path(category_id:category.id))
  end

  scenario "User sees the total sum of the activities amount" do
    activity1 = create(:activity, author: user, categories: [category])
    activity2 = create(:activity, author: user, categories: [category])

    login_as(user)

    visit categories_path

    expect(page).to have_content(category.total_amount)
  end
end
