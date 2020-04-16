require_relative '../lib/assembly'

describe "get a list of all assembly's deputies card" do
  it "verify if information is gathered" do
    expect(deputy_url).not_to be_nil
  end
  
  it "verify if result in an array" do
    expect(deputy_url).to be_a_kind_of(Array)     
  end

  it "the method returns the result for a deputy card" do
    expect(deputy_url[5]).to include("deputes" && "fiche")
  end
end

describe "get a list of assembly's deputies and their respective emails" do
  it "verify if information is gathered" do
    expect(deputy_mailto(deputy_url)).not_to be_nil
  end
  
  it "verify if result in an array" do
    expect(deputy_mailto(deputy_url)).to be_a_kind_of(Array)     
  end

  it "verify if array contains hash" do
    expect(deputy_mailto(deputy_url)[5]).to be_a_kind_of(Hash)
  end

  it "verify one of the contained hash keys is last name " do
    expect(deputy_mailto(deputy_url)[5].keys).to include("last name")
  end
end

