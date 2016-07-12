require 'dset.rb'

describe DSet do
  context "with not sets or arrays yet" do
    it "creates a new set" do
      dset = DSet.new
      expect(dset).to be_an_instance_of DSet
    end
  end
end
