require 'open-uri'
require 'json'

def generate_random_word
  require 'csv'
  filepath = 'words.csv'
  data = []
  data = CSV.foreach(filepath).map{ |row| row.to_a }
  random_word = data[rand(data.length)][0]
  if random_word[-1] == "s" || random_word[-1] == "z"
    generate_random_word
  else
    # puts "_ _ _ _ _"  #use when program live. Use code in below line when testing to view random_word
    return random_word
  end
end

@wordle = generate_random_word

def compare(answer, try)
  letter_position = 0
  until letter_position == try.length
    if answer[letter_position] == try[letter_position]
      print try[letter_position].upcase
    end
    if answer[letter_position] != try[letter_position] && answer.include?(try[letter_position])
      print try[letter_position].downcase
    end
    if answer[letter_position] != try[letter_position] && !answer.  include?(try[letter_position])
      print '_'
    end
    if answer == try

    end
    letter_position += 1
  end
  puts "\n"
end

def english_word?(word)
  response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
  json = JSON.parse(response.read)
  return json['found']
end

def five_letters?(word)
  if guess.lenth !=5
    puts 'invalid attempt, word needs to be five'
  end
end

def play
  puts "wordle is: #{@wordle}"
  attempts = 0
  until attempts == 6
    puts "enter your attempt"
    guess = gets.chomp.downcase
    if guess.length != 5
      puts 'invalid attempt. 5 letter english word required. Try again'
      attempts -= 1
    # elsif english_word?(guess) == false
    #   puts 'invalid attempt. 5 letter english word required. Try again'
    #   attempts -= 1
    elsif @wordle == guess
      break
    else
      compare(@wordle, guess)
    end
    attempts += 1
  end
  if attempts >= 6
    puts "You Lost, the correct word is #{@wordle}"
  elsif attempts == 0
    puts "Well done, you chose the correct word in 1 attempt"
  else
    puts "Well done, you chose the correct word in #{attempts + 1} attempts"
  end
end

play
