require "./enumerables"

describe Enumerable do
  array = [1, 2, 3, 4, 5, 6]
  describe "#my_each_method" do
    it "accepts a block as an argument" do
      expect(array.my_each_method { |i| i }).to eql(array)
    end
  end

  describe "#my_each" do
    it "accepts a block as an argument" do
      new_array = []
      array.my_each { |i| new_array << i }
      expect(new_array).to eql(array)
    end
  end

  describe "#my_each_with_index" do
    it "returns the index of element" do
      new_array = []
      array.my_each_with_index { |element, index| new_array << index }
      expect(new_array).to eql([0, 1, 2, 3, 4, 5])
    end
  end

  describe "#my_select" do
    it "returns an array of values where the given argument is true" do
      expect(array.my_select { |i| i.even? }).to eql([2, 4, 6])
    end
  end

  describe "#my_all?" do
    it "returns true if all elements of array satisfies the given argument" do
      new_array = [2, 4, 6]
      expect(new_array.my_all? { |i| i.even? }).to eql(true)
    end
  end

  describe "#my_any?" do
    it "returns true if any of the elements satisfies the given argument" do
      expect(array.my_any? { |i| i.odd? }).to eql(true)
    end
  end

  describe "#my_none?" do
    it "returns true if none of the elements satisfies the given argument" do
      new_array = [2, 4, 6]
      expect(new_array.my_none? { |i| i.odd? }).to eql(true)
    end
  end
end
