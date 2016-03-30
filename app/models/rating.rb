class Rating < ActiveRecord::Base
  validates :point, presence: true
  belongs_to :movie
  has_one :users
end
