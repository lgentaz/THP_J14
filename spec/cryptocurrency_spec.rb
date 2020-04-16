require_relative '../lib/cryptocurrency'

describe "currency scrapper method" do
  it "verify if information is gathered in the array" do
    expect(crypto_scrapper).not_to be_nil
  end
  
  it "verify if result in an array" do
  	expect(crypto_scrapper).to be_a_kind_of(Array)     
  end

  it "verify if array contains hash" do
  	expect(crypto_scrapper[5]).to be_a_kind_of(Hash)
  end

  it "verify that the array contains the symbol for bitcoin" do
    crypto_scrapper.each do |hash|
    	if expect(hash).to include("BTC") 
    		break
    	end
    end
  end 
end



