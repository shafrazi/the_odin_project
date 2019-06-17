dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string, dictionary)
  string = string.downcase!
  dictionary = dictionary.each {|word| word.downcase! }
  hash = {}

  dictionary.each do |word|
    count = 0
    if string.gsub!(word, word) == string
      count += 1
      hash[word] = count
    end
  end

  p hash
  #code
end

substrings("Below", dictionary)
