class Restaurant < ActiveRecord::Base

  has_many :reviews,
    -> { extending WithUserAssociationExtension },
    dependent: :destroy

  belongs_to :user
  validates :name, length: {minimum: 3}, uniqueness: true

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


  def average_rating
    return 'n/a' if reviews.none?
    (reviews.inject(0) {|memo, review| memo + review.rating } / reviews.length).to_i
  end

end
