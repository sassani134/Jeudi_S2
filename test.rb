require 'open-uri'
	require 'nokogiri'
	puts "get_the_email_of_a_townhal_from_its_webpage"
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
	doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
	  puts node.text
	end

	def perform
	value = push_the_entire_name_of_urls(get_all_the_urls_of_val_doise_townhalls)
	value2 = get_the_email_of_all_valdoise_townhalls(value)
	puts hash_name_and_urls(get_all_the_name_of_val_doise_townhalls,value2)
	
end

perform