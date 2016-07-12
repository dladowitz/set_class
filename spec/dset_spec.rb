require 'dset.rb'

describe DSet do
  context "with no sets or elements" do

    it "creates a new set" do
      @dset = DSet.new
      expect(@dset).to be_an_instance_of DSet
    end

    it "creates a new set an takes an array to initialize with" do
      @dset = DSet.new(["a", "b", "c"])
      expect(@dset.length).to eq 3
    end

    context "with an empty set" do
      before { @dset = DSet.new }

      describe '#length' do
        it "returns the length of the set" do
          expect(@dset.length).to eq 0
        end
      end

      describe "#add" do
        it "correcly adds elements to the set" do
          @dset.add("d")
          expect(@dset.length).to eq 1
        end
      end

      describe "#includes?" do
        it "returns true if an element is in the set" do
          @dset.add("d")
          expect(@dset.includes? "d").to be true
        end

        it "returns false if an element is not in the set" do
          expect(@dset.includes? "e").to be false
        end
      end
    end

    # it "adds elements to the set" do
    #   @dset.add "A"
    #   expect(@dset.length).to eq 1
    # end
  end
end
