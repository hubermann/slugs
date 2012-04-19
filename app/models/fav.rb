class Fav < ActiveRecord::Base
	validates_format_of :url, :with => URI::regexp(%w(http https))
	validates_presence_of :title, :url, :description

before_create :make_slug
  private

  def make_slug
    self.slug = self.title.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-')
  end


end
