require_relative '../lib/townhall'

describe "get a list of towns websites" do
  it "verify if information is gathered" do
    expect(get_townhall_urls).not_to be_nil
  end
  
  it "verify if result in an array" do
    expect(get_townhall_urls).to be_a_kind_of(Array)     
  end

  it "the method returns the result for argenteuil" do
    expect(get_townhall_urls[5]).to include("argenteuil")
  end
end

describe "get a list of towns and respective townhall emails" do
  it "verify if information is gathered" do
    expect(get_townhall_email(get_townhall_urls)).not_to be_nil
  end
  
  it "verify if result in an array" do
    expect(get_townhall_email(get_townhall_urls)).to be_a_kind_of(Array)     
  end

  it "verify if array contains hash" do
    expect(get_townhall_email(get_townhall_urls)[5]).to be_a_kind_of(Hash)
  end

  it "verify that the method returns an email match for argenteuil" do
    expect(get_townhall_email(get_townhall_urls)[5]).to include(/@ville-argenteuil.fr/)
  end
end

