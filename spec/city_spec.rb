require_relative '../lib/city.rb'

describe "sparp city email" do

    it "test url > email" do
    expect(get_townhall_email("http://annuaire-des-mairies.com/34/agde.html")).to eq("contact@ville-agde.fr")
    expect(get_townhall_email("http://annuaire-des-mairies.com/34/jacou.html")).to eq("mairie.jacou@wanadoo.fr")
    expect(get_townhall_email("http://annuaire-des-mairies.com/34/moureze.html")).to eq("mairie.moureze@orange.fr")
    end

end

