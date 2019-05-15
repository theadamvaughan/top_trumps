
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

# Prints out the users wrestlers

  puts "Here are your wrestlers;"
  print_user_cards(user_hand)
  
# Programme will loop until either the user or computer's hand collects all the cards

  user_card_number = 14

  spare_hand = []

  until user_card_number == 16 
  

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
    puts "you have selected Age\n"
    puts "My wrestler is #{computer_hand[0]["name"]}\n"
    puts "His age is #{computer_hand[0]["age"]}"
    if user_hand[0]["age"] < computer_hand[0]["age"]
      puts "This means you win!"
      user_hand << computer_hand[0]
      user_hand << user_hand.shift
      computer_hand.delete(computer_hand[0])
      computer_hand.each_with_index do |x, y| y =-1
      end
      user_card_number += 1
      user_hand.concat(spare_hand)
      spare_hand = []

    elsif user_hand[0]["age"] > computer_hand[0]["age"]
      puts "This means you lost"
      computer_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand << computer_hand.shift
      user_hand.each_with_index do |x, y| y =-1
      end
      user_card_number -= 1
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
      user_card_number -= 1
    end



  elsif attr == 1
    puts "you have selected Alive"


    
  elsif attr == 2
    puts "you have selected Debut\n"
    puts "My wrestler is #{computer_hand[0]["name"]}\n"
    puts "His debut was in #{computer_hand[0]["debut"]}"
    if user_hand[0]["debut"] < computer_hand[0]["debut"]
      puts "This means you win!"
      user_hand << computer_hand[0]
      user_hand << user_hand.shift
      computer_hand.delete(computer_hand[0])
      computer_hand.each_with_index do |x, y| y =-1
      end
      user_card_number += 1
      user_hand.concat(spare_hand)
      spare_hand = []

    elsif user_hand[0]["debut"] > computer_hand[0]["debut"]
      puts "This means you lost"
      computer_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand << computer_hand.shift
      user_hand.each_with_index do |x, y| y =-1
      end
      user_card_number -= 1
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
      user_card_number -= 1
    end





  elsif attr == 3
    puts "you have selected Championship wins\n"
    puts "My wrestler is #{computer_hand[0]["name"]}\n"
    puts "He has won #{computer_hand[0]["championships"]} championships"
    if user_hand[0]["championships"] > computer_hand[0]["championships"]
      puts "This means you win!"
      user_hand << computer_hand[0]
      user_hand << user_hand.shift
      computer_hand.delete(computer_hand[0])
      computer_hand.each_with_index do |x, y| y =-1
      end
      user_card_number += 1
      user_hand.concat(spare_hand)
      spare_hand = []

    elsif user_hand[0]["championships"] < computer_hand[0]["championships"]
      puts "This means you lost"
      computer_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand << computer_hand.shift
      user_hand.each_with_index do |x, y| y =-1
      end
      user_card_number -= 1
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
      user_card_number -= 1
    end



  elsif attr == 4
    puts "you have selected Movie appearences\n"
    puts "My wrestler is #{computer_hand[0]["name"]}\n"
    puts "He has been in #{computer_hand[0]["movies"]} movies"
    if user_hand[0]["movies"] > computer_hand[0]["movies"]
      puts "This means you win!"
      user_hand << computer_hand[0]
      user_hand << user_hand.shift
      computer_hand.delete(computer_hand[0])
      computer_hand.each_with_index do |x, y| y =-1
      end
      user_card_number += 1
      user_hand.concat(spare_hand)
      spare_hand = []

    elsif user_hand[0]["movies"] < computer_hand[0]["movies"]
      puts "This means you lost"
      computer_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand << computer_hand.shift
      user_hand.each_with_index do |x, y| y =-1
      end
      user_card_number -= 1
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
      user_card_number -= 1
    end





  elsif attr == 5
    puts "you have selected TV appearences\n"
    puts "My wrestler is #{computer_hand[0]["name"]}\n"
    puts "He has been in #{computer_hand[0]["unique_tv_shows"]} different TV shows"
    if user_hand[0]["unique_tv_shows"] > computer_hand[0]["unique_tv_shows"]
      puts "This means you win!"
      user_hand << computer_hand[0]
      user_hand << user_hand.shift
      computer_hand.delete(computer_hand[0])
      computer_hand.each_with_index do |x, y| y =-1
      end
      user_card_number += 1
      user_hand.concat(spare_hand)
      spare_hand = []

    elsif user_hand[0]["unique_tv_shows"] < computer_hand[0]["unique_tv_shows"]
      puts "This means you lost"
      computer_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand << computer_hand.shift
      user_hand.each_with_index do |x, y| y =-1
      end
      user_card_number -= 1
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
      user_card_number -= 1
    end




  elsif attr == 6 
    puts "you have selected to compare the wrestlers billed weight\n"
    puts "My wrestler is #{computer_hand[0]["name"]}\n"
    puts "His billed weight is #{computer_hand[0]["billed_weight"]}lbs"
    if user_hand[0]["billed_weight"] < computer_hand[0]["billed_weight"]
      puts "This means you win!"
      user_hand << computer_hand[0]
      user_hand << user_hand.shift
      computer_hand.delete(computer_hand[0])
      computer_hand.each_with_index do |x, y| y =-1
      end
      user_card_number += 1
      user_hand.concat(spare_hand)
      spare_hand = []

    elsif user_hand[0]["billed_weight"] > computer_hand[0]["billed_weight"]
      puts "This means you lost"
      computer_hand << user_hand[0]
      user_hand.delete(user_hand[0])
      computer_hand << computer_hand.shift
      user_hand.each_with_index do |x, y| y =-1
      end
      user_card_number -= 1
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
      user_card_number -= 1
    end

  end



  puts "Here are your cards\n\n"
  print_user_cards(user_hand)
  puts
  puts
  print_user_cards(computer_hand)
  puts
  puts
  print_user_cards(spare_hand)
end
end

details(WRESTLERS)