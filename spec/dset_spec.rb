require 'dset.rb'
require 'pry'

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

      it "does not add a second element with the same value" do
        @dset.add "a"
        @dset.add "a"
        expect(@dset.length).to eq 1
      end
    end

    describe "#include?" do
      it "returns true if an element is in the set" do
        @dset.add "a"
        expect(@dset.include? "a").to be true
      end

      it "returns false if an element is not in the set" do
        expect(@dset.include? "z").to be false
      end
    end

    describe "#delete" do
      it "deletes an item if its in the set" do
        @dset.add "a"
        @dset.delete "a"
        expect(@dset.include? "a").to be false
      end

      it "does nothing if an item is not in the set" do
        @dset.delete "a"
        expect(@dset.include? "a").to be false
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
          expect(@dset.include? "z").to be true
        end

        it "merges in another set" do
          dset2 = DSet.new ["x", "y", "z"]
          @dset.merge dset2
          expect(@dset.length).to eq 6
        end
      end

      describe "#has_subset?" do
        it "retuns true when all elements of an array are present" do
          expect(@dset.has_subset? ["a", "b"]).to be true
        end

        it "retuns true when all elements of a set are present" do
          dset2 = DSet.new ["a", "b"]
          expect(@dset.has_subset? dset2).to be true
        end

        it "returns false when an element from the array is missing from the set" do
          expect(@dset.has_subset? ["x", "b"]).to be false
        end

        it "retuns true when an element of a set is missing" do
          dset2 = DSet.new ["x", "b"]
          expect(@dset.has_subset? dset2).to be false
        end
      end

      describe "#superset?" do
        it "returns true when all elements in the set are in the super set" do
          dset2 = DSet.new ["a", "b", "c", "d", "e"]
          expect(@dset.in_superset? dset2).to be true
        end

        it "returns true when all elements in the set are in the super set" do
          expect(@dset.in_superset? [ "a", "b", "c", "d", "e"]).to be true
        end

        it "returns false if any elements from the set are missing from the superset" do
          dset2 = DSet.new [ "b", "c", "d", "e"]
          expect(@dset.in_superset? dset2).to be false
        end

        it "returns false if any elements from the set are missing from the superset" do
          expect(@dset.in_superset? [ "b", "c", "d", "e"]).to be false
        end
      end
    end
  end
end
