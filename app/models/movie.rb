class Movie < ActiveRecord::Base
 validates :title, :presence => true, :uniqueness => true
 validates :title, length: {minimum: 3}
 validates :title, length: {maximum: 20}
 validates :description, length: {maximum:50}
 

  before_validation :capitalize_title
  def capitalize_title
    #strip function remove the extra whitespaces at the beggining and end
    #split method return a substring of array
    #map will return a new array containing the values returned by the block
    #capitalize will capitalize the first character of string
    #join will return a string created by converting each element of the array to string
    self.title = self.title.strip() 
    self.title = self.title.split(/\s+/).map{|str| str.downcase}.map{|str| str.capitalize}.join(' ')
  end
end
