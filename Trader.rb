require 'rubygems'
require 'nokogiri'
require 'open-uri'
def every_hour(methode1)
	while true
	methode1
	sleep(3600)	

	end
	
end

def name_of_cryptocurrency
doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	#doc.css('tbody').each do |link|
	doc.xpath('/html/body/').each do |link|
	puts link.content
end
end

#every_hour(name_of_cryptocurrency)
name_of_cryptocurrency
