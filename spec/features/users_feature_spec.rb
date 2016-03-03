require 'rails_helper'

feature 'User can sign in' do
  context "User not signed in and on homepage" do
    it 'should see a "sign in" link and a "sign up" link' do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end

    it "should not be able to add a restaurant" do
      visit('/')
      click_link('Add a restaurant')
      expect(current_path).to eq '/users/sign_in'
      expect(page).to have_content 'Log in'
    end

    it "should not be able to add a review" do
      Restaurant.create(name: 'KFC')
      visit('/')
      click_link('Review KFC')
      expect(current_path).to eq '/users/sign_in'
      expect(page).to have_content 'Log in'
    end
  end

  context "user signed in on the homepage" do
    before do
      user_signs_up
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "Should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end

    it 'can only review a restaurant once' do
      add_restaurant
      add_review
      expect(page).not_to have_link("Review KFC")
    end
  end

  context "two users" do
    before do
      user_signs_up
      add_restaurant
      click_link('Sign out')
      user_signs_up('test2@email.com')
    end

    it "user can only edit/delete restaurant they created" do
      expect(page).not_to have_link 'Edit KFC'
      expect(page).not_to have_link 'Delete KFC'
    end

    xit "user can only delete their own reviews" do

    end
  end
end
