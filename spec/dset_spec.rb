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
          @dset.add "a"
          expect(@dset.length).to eq 1
        end
      end

      describe "#includes?" do
        it "returns true if an element is in the set" do
          @dset.add "a"
          expect(@dset.includes? "a").to be true
        end

        it "returns false if an element is not in the set" do
          expect(@dset.includes? "z").to be false
        end
      end

      describe "#delete" do
        it "deletes an item if its in the set" do
          @dset.add "a"
          @dset.delete "a"
          expect(@dset.includes? "a").to be false
        end

        it "does nothing if an item is not in the set" do
          @dset.delete "a"
          expect(@dset.includes? "a").to be false
        end
      end

      context "with elements already in the set" do
        before { @dset = DSet.new(["a", "b", "c"]) }

        describe "#each" do
          it "returns acts on each of the elements in the collection" do
            array = []
            @dset.each { |element| array << element }
            expect(array).to match_array ["a", "b", "c"]
          end
        end

        describe "#merge" do
          it "merges in an array of elements" do
            @dset.merge ["x", "y", "z"]
            expect(@dset.length).to eq 6
            expect(@dset.includes? "z").to be true
          end

          it "merges in another set" do
            dset2 = DSet.new ["x", "y", "z"]
            @dset.merge dset2
            expect(@dset.length).to eq 6
          end
        end
      end
    end

    # it "adds elements to the set" do
    #   @dset.add "A"
    #   expect(@dset.length).to eq 1
    # end
  end
end
