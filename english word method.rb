require 'open-uri'
require 'json'

def english_word?(word)
  response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
  json = JSON.parse(response.read)
  return json['found']
end

guess = 'aklmasda'

puts english_word?(guess)
