dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(str, dictionary)
  str_arr = str.downcase.scan(/\w+/)
  hash = {}
  dictionary = dictionary.each {|word| word.downcase! }

  str_arr.each do |string|
    count = 0
    dictionary.each do |word|
      # count = 0
      if string.gsub!(word, word) == string
        count += 1
        hash[word] = count
      end
    end
  end

  p hash
  #code
end

substrings("Howdy partner, sit down! How's it going?", dictionary)

# p words.scan(/\w+/)
