require_relative '../lib/assemblee.rb'

describe "scarp assemblee members email" do

    it "test url > email" do
    expect(testass(0)).to eq({"first_name"=>"Damien", "last_name"=>"Abad", "email"=>"Damien.Abad@assemblee-nationale.fr"})
    expect(testass(1)).to eq({"first_name"=>"Caroline", "last_name"=>"Abadie", "email"=>"Caroline.Abadie@assemblee-nationale.fr"})
    expect(testass(2)).to eq({"first_name"=>"Nadège", "last_name"=>"Abomangoli", "email"=>"nadege.abomangoli@assemblee-nationale.fr"})
    end

end

