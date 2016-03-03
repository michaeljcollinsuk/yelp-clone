require 'rails_helper'

describe Review, type: :model do
  it { should belong_to(:restaurant) }
  it { should belong_to(:user) }

  it 'is not possible to add a higher rating than 5' do
    review = Review.new(rating: 10)
    expect(review).to have(1).error_on(:rating)
  end

  describe 'build_with_user' do

    let(:user) { User.create email: 'test@test.com' }
    let(:restaurant) { Restaurant.create name: 'Test' }
    let(:review_params) { {rating: 5, thoughts: 'yum'} }

    subject(:review) { restaurant.reviews.build_with_user(review_params, user) }

    it 'builds a review' do
      expect(review).to be_a Review
    end

    it 'builds a review associated with the specified to the user' do
      expect(review.user).to eq user
    end
  end
end
