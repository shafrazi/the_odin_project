def caesar_cipher(string, shift)
  array = string.split("")
  new_array = []
  array.each do |letter|
    if ("a".."z").include?(letter) || ("A".."Z").include?(letter)
      if letter.upcase == letter
        n = letter.ord + shift
        if n > 90
          n = ((letter.ord + shift) - 90) + 64
        end
      else
        n = letter.ord + shift
        if n > 122
          n = ((letter.ord + shift) - 122) + 96
        end
      end
        new_array << n.chr
      else
        new_array << letter
      end
    end
    new_array.join("")
end

puts "Enter the message you need to cipher:"
string = gets.chomp
puts "Enter the shift value:"
shift = gets.chomp.to_i
puts caesar_cipher(string, shift)
