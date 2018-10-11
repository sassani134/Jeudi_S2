require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage
	
	puts "get_the_email_of_a_townhal_from_its_webpage"
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
	doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
	puts node.text
	end	

end


def get_all_the_urls_of_val_doise_townhalls

doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))

	# Search for nodes by css
	n = 0
	urls_of_val_doise_townhalls = Array.new
	until n>184
	urls_of_val_doise_townhalls << doc.css('.lientxt')[n]["href"]
	n = n+1
	end
	return urls_of_val_doise_townhalls
end

def get_all_the_name_of_val_doise_townhalls
	every_name = []
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	doc.css('.lientxt').each do |link|
	every_name = link.text
	puts every_name
	end
end

def push_the_entire_name_of_urls(methode1)
	complete_url = methode1.map { |word| word.sub('.', 'http://annuaire-des-mairies.com') }
	return complete_url
end

def hash_name_and_urls(methode1, methode2)
	liste_email = Hash.new
	methode1.count.times do |i|
		liste_email[methode1[i]] = methode2[i]
	end

	return liste_email
end

def get_the_email_of_all_valdoise_townhalls(methode1)
	n = 0
	all_email = []
	until n> 184
	doc = Nokogiri::HTML(open(methode1[n]))
	doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
	all_email << node.text

	n = n+1
	end
	end
	return all_email	
end

get_the_email_of_a_townhal_from_its_webpage


urls = push_the_entire_name_of_urls(get_all_the_urls_of_val_doise_townhalls)
mail = get_the_email_of_all_valdoise_townhalls(urls)
#get_all_the_name_of_val_doise_townhalls
#puts mail