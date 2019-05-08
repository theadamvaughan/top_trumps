
require 'json'
require 'TTY'
prompt = TTY::Prompt.new
file = File.open './wrestlers.json'
WRESTLERS = JSON.parse(file.read)
choices = [
  {name: 'Age', value: 0},
  {name: 'Alive', value: 1},
  {name: 'Debut', value: 2},
  {name: 'Championships', value: 3},
  {name: 'Number of TV appearences', value: 4},
  {name: 'Number of TV shows', value: 5},
  {name: 'Billed weight', value: 6}
]

computer_hand = []
user_hand = []

# The Computer will randomly seperate the WRESTLERS into two Hands; one for the User one for the Computer

def print_user_cards(arr)
  arr.each { |wrestler| puts wrestler["name"] }
end

class Array
  def fisher_yates_shuffle
    upper = self.length - 1
    upper.downto(1).each do |current_index|
      random_index = rand(current_index + 1)
      temp = self[random_index]
      self[random_index] = self[current_index]
      self[current_index] = temp
    end
    self
  end
end

def details(arr)
  computer_hand = []
  user_hand = []
  arr.fisher_yates_shuffle
  arr.each_with_index do |wrestler, index|
    if index.even?
      user_hand << wrestler 
    else
      computer_hand << wrestler
    end
  end
  
  puts "Here are your wrestlers;"
  print_user_cards(user_hand)
  
  puts "\nYour first wrestler is #{user_hand[0]["name"]}"
  puts "Here are his attributes;"
  puts "Age: #{user_hand[0]["age"]}"
  puts "Alive?: #{user_hand[0]["alive"]}"
  puts "Debut: : #{user_hand[0]["debut"]}"
  puts "Championships: #{user_hand[0]["championships"]}"
  puts "Number of movie apperances: #{user_hand[0]["movies"]}"
  puts "Number of TV shows: : #{user_hand[0]["unique_tv_shows"]}"
  puts "Billed weight: : #{user_hand[0]["billed_weight"]} lbs"
end


details(WRESTLERS)

# The Hands will be stored in an Hash, and used in a round in order starting from the first Index Position



# The User will get the option to select a Key Value Pair from the object in first Index position 

puts "Please select an attribute to challange the computer"
attr = prompt.select("Choose your attribute?", choices)
puts attr


if attr == 0 
  puts "you have selected Age"
elsif attr == 1
  puts "you have selected Alive"
  puts user_hand
elsif attr == 2
  puts "you have selected Debut"
elsif attr == 3
  puts "you have selected Championships"
elsif attr == 4
  puts "you have selected TV appearences"
elsif attr == 5
  puts "you have selected TV shows"
else
  puts "you have selected Billed weight"
end



# The Computer will compare its first card's attributes against the attriutbes the User has selected


# The winner will be the highest of the two numbers unless stated above


# The winner will take the others card and it will be added to the back of the pile

# .push method?

# If there is a draw the User will keep selecting until someone wins the round


# The winner is the player to collect all 16 cards
