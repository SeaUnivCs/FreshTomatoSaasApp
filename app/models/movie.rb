class Movie < ActiveRecord::Base
  validates :title, :description, :presence => true
end
