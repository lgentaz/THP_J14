require 'nokogiri'
require 'open-uri'
require 'pry'

def get_townhall_email(townhall_url)
	all_townhall_emails = []
	townhall_url.each do |url|
		mailto = Hash.new
		doc = Nokogiri::HTML(open(url))
		town = doc.xpath('//strong/a[@class="lientxt4"][1]').text.capitalize
		e_mail =  doc.xpath('//td[contains(text(),"@")]').text
		mailto = {town => e_mail}
		all_townhall_emails << mailto
	end
#	puts all_townhall_emails.size
	return all_townhall_emails
end

def get_townhall_urls
	townhall_url = "http://annuaire-des-mairies.com/"
	val_d_oise_url = townhall_url + "val-d-oise.html"
	directory = []
	doc = Nokogiri::HTML(open(val_d_oise_url))
	townhall_url = doc.xpath('//a[@class="lientxt"]//@href').each do |node|
		directory << townhall_url + node.text.gsub("./", "")
	end
	return directory
end

get_townhall_email(get_townhall_urls)

