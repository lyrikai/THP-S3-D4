require_relative '../lib/trader.rb'

describe "sparp and retrun cryto value" do

    it "test Bitcoin value" do
    expect(test(0)).to eq("Bitcoin")
    end

    it "test Ethereum value" do
        expect(test(1)).to eq("Ethereum")
    end

    it "test Tether value" do
        expect(test(2)).to eq("Tether")
    end
end

