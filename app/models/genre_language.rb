class GenreLanguage < ActiveRecord::Base
   validates_uniqueness_of :name
   validates_presence_of :name ,message: "Please add value to Language"
   validates_length_of :name, maximum: 30, message: "less than 30 characters please"
  #validates_format_of :name, :with => /\^[a-zA-Z]+\$/
  validates :name, format: {with: /\A[a-zA-Z_ \-]*\z/}#, message: "only allow characters"
  auto_strip_attributes :name, :squish => true, :nullify => false

end
