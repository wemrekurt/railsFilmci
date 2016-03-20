class Movie < ActiveRecord::Base
    validates :title, presence: true
    validates :description, presence: true
    validates :date, numericality: true
    has_attached_file :image, styles: { medium: "182x268>", small: "150x150>" }
	  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
