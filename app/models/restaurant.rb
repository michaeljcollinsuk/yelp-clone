class Restaurant < ActiveRecord::Base

  has_many :reviews,
    -> { extending WithUserAssociationExtension },
    dependent: :destroy

  belongs_to :user
  validates :name, length: {minimum: 3}, uniqueness: true
  # validates :user, uniqueness: { scope: :restaurant, message: "You have reviewed this restaurant already" }

end
