# .... https://www.codecademy.com/courses/learn-ruby/lessons/a-night-at-the-movies/exercises/what-youll-be-building-5?action=resume_content_item


require 'json'
require 'TTY'
file = File.open './cars.json'
CARS = JSON.parse(file.read)

# Code to print a list of the cards in the users hand

def print_user_cards(arr)
  arr.each { |car| puts car["name"] }
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

computer_hand = []
user_hand = []

def details(arr)
  computer_hand = []
  user_hand = []
  arr.fisher_yates_shuffle
  arr.each_with_index do |car, index|
    if index.even?
      user_hand << car 
    else
      computer_hand << car
    end
  end

spare_hand = []

def user_win(user_hand, computer_hand, spare_hand)
  user_hand << computer_hand[0]
  user_hand << user_hand.shift
  computer_hand.delete(computer_hand[0])
  computer_hand.each_with_index { |x, y| y =-1 }
  user_hand.concat(spare_hand)
end

# Programme will loop until either the user or computer's hand collects all the cards


  until user_hand.count == 0 || computer_hand.count == 0
  puts "Here are your cars;\n\n"
  print_user_cards(user_hand)
  puts "\nYour car is #{user_hand[0]["name"]}"
  puts "Here are its attributes;"
  puts "0 to 60mph: #{user_hand[0]["0_60mph"]} seconds"
  puts "Top Speed: #{user_hand[0]["top_speed"]}"
  puts "BHP: #{user_hand[0]["bhp"]}"
  puts "Weight: #{user_hand[0]["weight"]}kgs"
  puts "Engine Capacity: #{user_hand[0]["engine_capacity"]}cc"
  puts "Cost: £#{user_hand[0]["used_price"]}\n\n"

  prompt = TTY::Prompt.new
  choices = [
  {name: '0 to 60mph', value: 0},
  {name: 'Top Speed', value: 1},
  {name: 'BHP', value: 2},
  {name: 'Weight', value: 3},
  {name: 'Engine Capacity', value: 4},
  {name: 'Cost', value: 5}
]
  puts "Please select an attribute to challange the computer\n"
  attr = prompt.select("Choose your attribute?", choices)
  if attr == 0
    puts "\nMy car is the #{computer_hand[0]["name"]}\n"
    puts "It's 0 to 60mph is #{computer_hand[0]["0_60mph"]} seconds"
    if user_hand[0]["0_60mph"] < computer_hand[0]["0_60mph"]
      puts "This means you win!\n\n"
      user_win(user_hand, computer_hand, spare_hand)
      spare_hand = []
    elsif user_hand[0]["0_60mph"] > computer_hand[0]["0_60mph"]
      puts "This means you lost\n\n"
      computer_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand << computer_hand.shift
      user_hand.each_with_index { |x, y| y =-1 }
      computer_hand.concat(spare_hand)
      spare_hand = []
    else
      puts "It's a draw!\n\n"
      spare_hand << computer_hand[0]
      spare_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand.delete(computer_hand[0])
      computer_hand.each_with_index { |x, y| y =-1 }
      user_hand.each_with_index { |x, y| y =-1 }
    end
  elsif attr == 1
    puts "\nMy car is the #{computer_hand[0]["name"]}\n"
    puts "It's top speed is #{computer_hand[0]["top_speed"]}mph"
    if user_hand[0]["top_speed"] > computer_hand[0]["top_speed"]
      puts "This means you win!\n\n"
      user_win(user_hand, computer_hand, spare_hand)
      spare_hand = []
    elsif user_hand[0]["top_speed"] < computer_hand[0]["top_speed"]
      puts "This means you lost\n\n"
      computer_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand << computer_hand.shift
      user_hand.each_with_index { |x, y| y =-1 }
      computer_hand.concat(spare_hand)
      spare_hand = []
    else
      puts "It's a draw!\n\n"
      spare_hand << computer_hand[0]
      spare_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand.delete(computer_hand[0])
    end
      computer_hand.each_with_index { |x, y| y =-1 }
      user_hand.each_with_index { |x, y| y =-1 }
  elsif attr == 2
    puts "\nMy car is the #{computer_hand[0]["name"]}\n"
    puts "Its BHP is #{computer_hand[0]["bhp"]}"
    if user_hand[0]["bhp"] > computer_hand[0]["bhp"]
      puts "This means you win!\n\n"
      user_win(user_hand, computer_hand, spare_hand)
      spare_hand = []
    elsif user_hand[0]["bhp"] < computer_hand[0]["bhp"]
      puts "This means you lost\n\n"
      computer_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand << computer_hand.shift
      user_hand.each_with_index { |x, y| y =-1 }
      computer_hand.concat(spare_hand)
      spare_hand = []
    else
      puts "It's a draw!\n\n"
      spare_hand << computer_hand[0]
      spare_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand.delete(computer_hand[0])
    end
      computer_hand.each_with_index { |x, y| y =-1 }
      user_hand.each_with_index { |x, y| y =-1 }
  elsif attr == 3
    puts "\nMy car is the #{computer_hand[0]["name"]}\n"
    puts "Its weight is #{computer_hand[0]["weight"]}kgs"
    if user_hand[0]["weight"] < computer_hand[0]["weight"]
      puts "This means you win!\n\n"
      user_win(user_hand, computer_hand, spare_hand)
      spare_hand = []
    elsif user_hand[0]["weight"] > computer_hand[0]["weight"]
      puts "This means you lost\n\n"
      computer_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand << computer_hand.shift
      user_hand.each_with_index { |x, y| y =-1 }
      computer_hand.concat(spare_hand)
      spare_hand = []
    else
      puts "It's a draw!\n\n"
      spare_hand << computer_hand[0]
      spare_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand.delete(computer_hand[0])
    end
      computer_hand.each_with_index { |x, y| y =-1 }
      user_hand.each_with_index { |x, y| y =-1 }
  elsif attr == 4
    puts "\nMy car is the #{computer_hand[0]["name"]}\n"
    puts "It has an engine capacity of #{computer_hand[0]["engine_capacity"]}cc"
    if user_hand[0]["engine_capacity"] > computer_hand[0]["engine_capacity"]
      puts "This means you win!\n\n"
      user_win(user_hand, computer_hand, spare_hand)
      spare_hand = []
    elsif user_hand[0]["engine_capacity"] < computer_hand[0]["engine_capacity"]
      puts "This means you lost\n\n"
      computer_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand << computer_hand.shift
      user_hand.each_with_index { |x, y| y =-1 }
      computer_hand.concat(spare_hand)
      spare_hand = []
    else
      puts "It's a draw!\n\n"
      spare_hand << computer_hand[0]
      spare_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand.delete(computer_hand[0])
    end
  elsif attr == 5
    puts "\nMy car is the #{computer_hand[0]["name"]}\n"
    puts "It costs £#{computer_hand[0]["used_price"]}"
    if user_hand[0]["used_price"] > computer_hand[0]["used_price"]
      puts "This means you win!\n\n"
      user_win(user_hand, computer_hand, spare_hand)
      spare_hand = []
    elsif user_hand[0]["used_price"] < computer_hand[0]["used_price"]
      puts "This means you lost\n\n"
      computer_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand << computer_hand.shift
      user_hand.each_with_index { |x, y| y =-1 }
      computer_hand.concat(spare_hand)
      spare_hand = []
    else
      puts "It's a draw!\n\n"
      spare_hand << computer_hand[0]
      spare_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand.delete(computer_hand[0])
    end
      computer_hand.each_with_index { |x, y| y =-1 }
      user_hand.each_with_index { |x, y| y =-1 }
    end
  end
end

details(CARS)