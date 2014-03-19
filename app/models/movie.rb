class Movie < ActiveRecord::Base
  validates :title, :presence => true, :uniqueness => true, :length => {minimum: 3, too_short: "must have at least %{count} chars"}
  before_save :capitalize_title
  def capitalize_title
    self.title = self.title.split(/\s+/).map(&:downcase).map(&:capitalize).join(' ')
  end
end
