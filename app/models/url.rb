class Url < ActiveRecord::Base
	before_create :shorten_url
	#url MUSt have http or https
	validates_format_of :long_url, :with => URI::regexp(%w(http https)), message: "Enter a valid URL fool."
  
  def click
  	self.click_count += 1
  end

private
  def shorten_url
    self.short_url = Array.new(8){[*'0'..'9', *'a'..'z', *'A'..'Z'].sample}.join
	end
end
