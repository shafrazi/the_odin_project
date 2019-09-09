require "./caesar_cipher"

describe "#caesar_cipher" do
  it "returns 'ujchtcbk' when given a shift value of 2" do
    string = "shafrazi"
    expect(caesar_cipher(string, 2)).to eql("ujchtcbk")
  end

  it "returns 'bcd' when given a shift value of 1" do
    string = "abc"
    expect(caesar_cipher(string, 1)).to eql("bcd")
  end

  it "returns 'Bcd' when given a shift value of 1" do
    string = "Abc"
    expect(caesar_cipher(string, 1)).to eql("Bcd")
  end
end
