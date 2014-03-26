class Movie < ActiveRecord::Base
  validates :title, :presence => true, :uniqueness => true, :length => {minimum: 3, too_short: "must have at least %{count} chars"}
  before_save :capitalize_title
  has_attached_file :pic, :styles => 
	{ :medium => "300*300>", :thumb => "100*100>" },
        :url => ":s3_url"
#        :storage => :s3, :s3_credentials => "#{Rails.root}/config/aws.yml",
#        :path => ":attachment/:id/:style.:extension",
#        :bucket => 'freshtomato'
  def capitalize_title
    self.title = self.title.split(/\s+/).map(&:downcase).map(&:capitalize).join(' ')
  end
end
