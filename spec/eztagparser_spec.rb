RSpec.describe Eztagparser do
  it "has a version number" do
    expect(Eztagparser::VERSION).not_to be nil
  end

  it "gets a single tag" do
    expect(eztag("<x> Hello! </x>")).to eq({"x"=>"Hello!"})
  end

  it "gets a 1+ tag" do
    expect(eztag("<x> Hello! </x>")).to eq({"x"=>{"y"=>"Hello"}})
    end


end
