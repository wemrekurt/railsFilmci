class Movie < ActiveRecord::Base
    has_many :comments
    has_many :reservations
    has_and_belongs_to_many :categories
    has_many :users
    has_many :ratings, through: :users


    validates :title, presence: true
    validates :description, presence: true
    validates :date, numericality: true
    has_attached_file :image, styles: { medium: "182x268>", small: "150x150>" }
	  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
