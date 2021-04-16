require 'rails_helper'

RSpec.feature "Forms", type: :feature do
  it 'enters the name and receives greeting' do
    visit 'sign_in'
    fill_in :name, with: 'zil'
    click_on 'commit'
    expect(page).to have_content 'Events'
  end
  it 'enters the name and sign up' do
    visit 'users/new'
    fill_in :user_name, with: 'capybara'
    click_on 'commit'
    expect(page).to have_content "Capybara's Created Events"
  end
end
