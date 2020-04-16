require 'nokogiri'
require 'open-uri'
require 'pry'

def deputy_url
	url_assembly = "http://www2.assemblee-nationale.fr"
	all_deputy_urls = []
	doc = Nokogiri::HTML(open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))
	deputy_card = doc.xpath('//div[@id="deputes-list"]//@href').each do |node|
		all_deputy_urls << url_assembly + node.text
	end
	return all_deputy_urls
end

puts deputy_url

def deputy_mailto(multi_url)
	directory = []
	multi_url.each do |url|
		mailto = Hash.new
		doc = Nokogiri::HTML(open(url))
		full_name = doc.xpath('//div[@id="page-fond"]//h1').text.split(" ")
		e_mail =  doc.xpath('//li[contains(text(),"Mél")]/a').text
		mailto = {"first name" => full_name[1], "last name" => full_name[2], "email" => e_mail}
		directory << mailto
	end
	return directory
end

puts deputy_mailto(deputy_url)
