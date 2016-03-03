def user_signs_up(email='test@example.com', password='testtest')
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  fill_in('Password confirmation', with: password)
  click_button('Sign up')
end

def add_restaurant(name='KFC')
  click_link 'Add a restaurant'
  fill_in 'Name', with: name
  click_button 'Create Restaurant'
end

def add_review(rating=3)
  click_link 'Review KFC'
  fill_in "Thoughts", with: "so, so"
  select rating, from: "Rating"
  click_button 'Leave review'
end
