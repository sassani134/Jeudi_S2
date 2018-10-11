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
	doc.css('tbody').css('tr').css('a.currency-name-container.link-secondary').each do |link|
	puts link.content
	#parse_page.css(‘.content’).css(‘.row’).css(‘.hdrlnk’)
end
end
def price_in_currency
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	doc.css('tbody').css('tr').css('td.no-wrap.market-cap.text-right').each do |link|
	puts link.text
end
end
def arrays_in_hash(methode1, methode2)
	liste_crypto = Hash.new
	methode1.count.times do |i|
		liste_crypto[methode1[i]] = methode2[i]
	end

	return liste_crypto
end

#every_hour(name_of_cryptocurrency)
#name_of_cryptocurrency
price_in_currency