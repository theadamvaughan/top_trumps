
require 'json'
require 'TTY'
file = File.open './wrestlers.json'
WRESTLERS = JSON.parse(file.read)

computer_hand = []
user_hand = []

# Code to print a list of the cards in the users hand

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

# fisher yates shuffle so that the cards are randomly split into two piles to start the game
# and then the details are printed out into the terminal

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

# Programme will loop until either the user or computer's hand collects all the cards

  spare_hand = []

  until user_hand.count == 16 || computer_hand.count == 16
  puts "Here are your wrestlers;\n\n"
  print_user_cards(user_hand)
  puts "\nYour wrestler is #{user_hand[0]["name"]}"
  puts "Here are his attributes;"
  puts "Age: #{user_hand[0]["age"]}"
  puts "Alive?: #{user_hand[0]["alive"]}"
  puts "Debut: #{user_hand[0]["debut"]}"
  puts "Championships: #{user_hand[0]["championships"]}"
  puts "Number of movie apperances: #{user_hand[0]["movies"]}"
  puts "Number of TV shows: #{user_hand[0]["unique_tv_shows"]}"
  puts "Billed weight: #{user_hand[0]["billed_weight"]} lbs\n\n"

  prompt = TTY::Prompt.new
  choices = [
  {name: 'Age', value: 0},
  {name: 'Alive', value: 1},
  {name: 'Debut', value: 2},
  {name: 'Championships', value: 3},
  {name: 'Number of Movies appeared in', value: 4},
  {name: 'Number of TV shows', value: 5},
  {name: 'Billed weight', value: 6}
]

  puts "Please select an attribute to challange the computer\n"
  attr = prompt.select("Choose your attribute?", choices)

  if attr == 0
    puts "\nMy wrestler is #{computer_hand[0]["name"]}\n"
    puts "His age is #{computer_hand[0]["age"]}"
    if user_hand[0]["age"] < computer_hand[0]["age"]
      puts "This means you win!\n\n"
      user_hand << computer_hand[0]
      user_hand << user_hand.shift
      computer_hand.delete(computer_hand[0])
      computer_hand.each_with_index do |x, y| y =-1
      end
      user_hand.concat(spare_hand)
      spare_hand = []
    elsif user_hand[0]["age"] > computer_hand[0]["age"]
      puts "This means you lost\n\n"
      computer_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand << computer_hand.shift
      user_hand.each_with_index do |x, y| y =-1
      end
      computer_hand.concat(spare_hand)
      spare_hand = []
    else
      puts "It's a draw!\n\n"
      spare_hand << computer_hand[0]
      spare_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand.delete(computer_hand[0])
      end
      computer_hand.each_with_index do |x, y| y =-1
      user_hand.each_with_index do |x, y| y =-1
      end
    end
  elsif attr == 1
    puts "\nMy wrestler is #{computer_hand[0]["name"]}\n"
    if computer_hand[0]["alive"] == false
      puts "Sadly he is no longer with us."
    else
      puts "He is still alive"
    end
    if user_hand[0]["alive"] == true && computer_hand[0]["alive"] == false
      puts "This means you win!\n\n"
      user_hand << computer_hand[0]
      user_hand << user_hand.shift
      computer_hand.delete(computer_hand[0])
      computer_hand.each_with_index do |x, y| y =-1
      end
      user_card_number + spare_hand_count
      user_hand.concat(spare_hand)
      spare_hand = []
    elsif user_hand[0]["alive"] == false && computer_hand[0]["alive"] ==   true
      puts "This means you lost\n\n"
      computer_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand << computer_hand.shift
      user_hand.each_with_index do |x, y| y =-1
      end
      computer_hand.concat(spare_hand)
      spare_hand = []
    else
      puts "It's a draw!\n\n"
      spare_hand << computer_hand[0]
      spare_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand.delete(computer_hand[0])
      end
      computer_hand.each_with_index do |x, y| y =-1
      user_hand.each_with_index do |x, y| y =-1
      end
    end
  elsif attr == 2
    puts"\nMy wrestler is #{computer_hand[0]["name"]}\n"
    puts "His debut was in #{computer_hand[0]["debut"]}"
    if user_hand[0]["debut"] < computer_hand[0]["debut"]
      puts "This means you win!\n\n"
      user_hand << computer_hand[0]
      user_hand << user_hand.shift
      computer_hand.delete(computer_hand[0])
      computer_hand.each_with_index do |x, y| y =-1
      end
      user_hand.concat(spare_hand)
      spare_hand = []
    elsif user_hand[0]["debut"] > computer_hand[0]["debut"]
      puts "This means you lost\n\n"
      computer_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand << computer_hand.shift
      user_hand.each_with_index do |x, y| y =-1
      end
      computer_hand.concat(spare_hand)
      spare_hand = []
    else
      puts "It's a draw!\n\n"
      spare_hand << computer_hand[0]
      spare_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand.delete(computer_hand[0])
      end
      computer_hand.each_with_index do |x, y| y =-1
      user_hand.each_with_index do |x, y| y =-1
      end
    end
  elsif attr == 3
    puts"\nMy wrestler is #{computer_hand[0]["name"]}\n"
    puts "He has won #{computer_hand[0]["championships"]} championships"
    if user_hand[0]["championships"] > computer_hand[0]["championships"]
      puts "This means you win!\n\n"
      user_hand << computer_hand[0]
      user_hand << user_hand.shift
      computer_hand.delete(computer_hand[0])
      computer_hand.each_with_index do |x, y| y =-1
      end
      user_hand.concat(spare_hand)
      spare_hand = []
    elsif user_hand[0]["championships"] < computer_hand[0]["championships"]
      puts "This means you lost\n\n"
      computer_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand << computer_hand.shift
      user_hand.each_with_index do |x, y| y =-1
      end
      computer_hand.concat(spare_hand)
      spare_hand = []
    else
      puts "It's a draw!\n\n"
      spare_hand << computer_hand[0]
      spare_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand.delete(computer_hand[0])
      end
      computer_hand.each_with_index do |x, y| y =-1
      user_hand.each_with_index do |x, y| y =-1
      end
    end
  elsif attr == 4
    puts"\nMy wrestler is #{computer_hand[0]["name"]}\n"
    puts "He has been in #{computer_hand[0]["movies"]} movies"
    if user_hand[0]["movies"] > computer_hand[0]["movies"]
      puts "This means you win!\n\n"
      user_hand << computer_hand[0]
      user_hand << user_hand.shift
      computer_hand.delete(computer_hand[0])
      computer_hand.each_with_index do |x, y| y =-1
      end
      user_hand.concat(spare_hand)
      spare_hand = []
    elsif user_hand[0]["movies"] < computer_hand[0]["movies"]
      puts "This means you lost\n\n"
      computer_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand << computer_hand.shift
      user_hand.each_with_index do |x, y| y =-1
      end
      computer_hand.concat(spare_hand)
      spare_hand = []
    else
      puts "It's a draw!\n\n"
      spare_hand << computer_hand[0]
      spare_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand.delete(computer_hand[0])
      end
      computer_hand.each_with_index do |x, y| y =-1
      user_hand.each_with_index do |x, y| y =-1
      end
    end
  elsif attr == 5
    puts"\nMy wrestler is #{computer_hand[0]["name"]}\n"
    puts "He has been in #{computer_hand[0]["unique_tv_shows"]} different TV shows"
    if user_hand[0]["unique_tv_shows"] > computer_hand[0]["unique_tv_shows"]
      puts "This means you win!\n\n"
      user_hand << computer_hand[0]
      user_hand << user_hand.shift
      computer_hand.delete(computer_hand[0])
      computer_hand.each_with_index do |x, y| y =-1
      end
      user_hand.concat(spare_hand)
      spare_hand = []
    elsif user_hand[0]["unique_tv_shows"] < computer_hand[0]["unique_tv_shows"]
      puts "This means you lost\n\n"
      computer_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand << computer_hand.shift
      user_hand.each_with_index do |x, y| y =-1
      end
      computer_hand.concat(spare_hand)
      spare_hand = []
    else
      puts "It's a draw!\n\n"
      spare_hand << computer_hand[0]
      spare_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand.delete(computer_hand[0])
      end
      computer_hand.each_with_index do |x, y| y =-1
      user_hand.each_with_index do |x, y| y =-1
      end
    end
  elsif attr == 6 
    puts"\nMy wrestler is #{computer_hand[0]["name"]}\n"
    puts "His billed weight is #{computer_hand[0]["billed_weight"]}lbs"
    if user_hand[0]["billed_weight"] < computer_hand[0]["billed_weight"]
      puts "This means you win!"
      user_hand << computer_hand[0]
      user_hand << user_hand.shift
      computer_hand.delete(computer_hand[0])
      computer_hand.each_with_index do |x, y| y =-1
      end
      user_hand.concat(spare_hand)
      spare_hand = []
    elsif user_hand[0]["billed_weight"] > computer_hand[0]["billed_weight"]
      puts "This means you lost"
      computer_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand << computer_hand.shift
      user_hand.each_with_index do |x, y| y =-1
      end
      computer_hand.concat(spare_hand)
      spare_hand = []
    else
      puts "It's a draw!"
      spare_hand << computer_hand[0]
      spare_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand.delete(computer_hand[0])
      end
      computer_hand.each_with_index do |x, y| y =-1
      user_hand.each_with_index do |x, y| y =-1
      end
    end  
  end
  end

end

details(WRESTLERS)