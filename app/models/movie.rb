class Movie < ActiveRecord::Base
  #Defines an array containing all the possible ratings for movies, 
  #will return upon request. (shortcut: array of strings)
  def self.all_ratings  
  	%w[G PG PG-13 R NC-17]  
  end 

  #Calls capitalize.
  before_save :capitalize_title

  #Validates model fields for movie, most importantly that they are present.
  validates :title, :presence => true, :uniqueness => true, length: {minimum: 3}
  validates :release_date, :presence => true
  validate :released_1930_or_later   # uses custom validator below
  validates :rating, :inclusion => {:in => Movie.all_ratings},
    :unless => :grandfathered?

  #Capitalizes the title by putting it in and array and storing it
  #to movie title again, separated by a single space.
  def capitalize
  	self.title = self.title.split(/\s+/).map(&:capitalize).join(' ')
  end

  #Checks to make sure the prtdate is after January 1st, 1930, otherwise
  #display error for date.
  def released_1930_or_later
    errors.add(:release_date, 'must be 1930 or later') if
      self.release_date < Date.parse('1 Jan 1930')
  end
  
  #Since ratings were not used before November 1st, 1968, this
  #ignores ratings for movies before this date.
  @@grandfathered_date = Date.parse('1 Nov 1968')
  def grandfathered?
  	self.release_date >= @@grandfathered_date
   end
end
