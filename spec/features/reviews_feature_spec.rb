require 'rails_helper'

feature 'reviewing' do
  before {Restaurant.create(name:"KFC")}

  scenario 'allows user to leave a review using a form' do
    visit '/restaurants'
    click_link "Review KFC"
    fill_in 'Thoughts', with: 'Finger lickin good'
    select '3', from: 'Rating'
    click_button 'Leave review'

    expect(current_path).to eq '/restaurants'
    expect(page).to have_content 'Finger lickin good'
  end
end
