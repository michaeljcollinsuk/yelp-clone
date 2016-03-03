require 'rails_helper'

describe Restaurant, type: :model do
  it { is_expected.to have_many :reviews }

  it { should belong_to(:user) }

  it { should have_many(:reviews).dependent(:destroy) }

  it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(name: 'kf')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it 'is not valid unless it is a unique name' do
    Restaurant.create(name: "Moe's Tavern")
    restaurant = Restaurant.create(name: "Moe's Tavern")
    expect(restaurant).to have(1).error_on(:name)
  end

  context 'no reviews' do
    it 'returns "n/a"' do
      restaurant = Restaurant.create(name: "Moe's Tavern")
      expect(restaurant.average_rating).to eq 'n/a'
    end
  end

  context 'multiple reviews' do
    it 'returns the average' do
      restaurant = Restaurant.create(name: "Moe's Tavern")
      restaurant.reviews.create(rating: 1)
      restaurant.reviews.create(rating: 5)
      expect(restaurant.average_rating).to eq 3
    end
  end
end
