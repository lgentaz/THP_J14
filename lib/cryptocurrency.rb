require 'nokogiri'
require 'open-uri'
require 'pry'

def crypto_scrapper
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	crypto_arr = []
	crypto_hash = Hash.new
	crypto_line = doc.xpath('//tr').each do |node|
		key = node.xpath('td[3]').text
		value = node.xpath('td[5]').text.gsub(/[,$]/, "").to_f
		if key != ""
		   crypto_hash = {key => value}
		   crypto_arr << crypto_hash
		end
	end
	return crypto_arr
end

#puts crypto_scrapper