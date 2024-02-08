require 'rails_helper'

RSpec.feature "Categories", type: :feature do
  let(:user) { create(:user) }

  scenario 'User views categories list' do
    category1 = create(:category, user: user)
    category2 = create(:category, user: user)

    login_as(user)

    visit categories_path

    expect(page).to have_selector('.category-item', count: 2)
    expect(page).to have_content(category1.name)
    expect(page).to have_content('$0.00')
    expect(page).to have_content(category2.name)
    expect(page).to have_content('$0.00')
  end

  scenario "User views empty categories list" do
    login_as(user)

    visit categories_path

    expect(page).to have_content('Empty list, new Categories will show here...')
  end

  scenario "User navigates to add new category page" do
    login_as(user)

    visit categories_path

    click_link 'Add a New Category'

    expect(page).to have_current_path(new_category_path)
  end
end
