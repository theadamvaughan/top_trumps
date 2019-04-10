
WRESTLERS = [ 
  {
    name: 'Raven',
    age: 54,
    alive: true,
    debut: 1988,
    championships: 32,
    movies: 4,
    unique_tv_shows: 5,
    billed_weight: 235,
  },

  {
    name: 'Edge',
    age: 45,
    alive: true,
    debut: 1992,
    championships: 31,
    movies: 4,
    unique_tv_shows: 14,
    billed_weight: 241,
  },

  {
    name: 'Ric Flair',
    age: 70,
    alive: true,
    debut: 1972,
    championships: 29,
    movies: 0,
    tv_shows: 0,
    billed_weight: 243,
  },

  {
    name: 'Chris Jericho',
    age: 48,
    alive: true,
    debut: 1990,
    championships: 28,
    movies: 6,
    tv_shows: 20,
    billed_weight: 227,
  },

  {
    name: 'Booker T',
    age: 54,
    alive: true,
    debut: 1989,
    championships: 27,
    movies: 1,
    tv_shows: 2,
    billed_weight: 256,
  },

  {
    name: 'Crash Holly',
    age: 32,
    alive: false,
    debut: 1989,
    championships: 25,
    movies: 0,
    unique_tv_shows: 0,
    billed_weight: 205,
  },

  {
    name: 'JBL/Bradshaw',
    age: 52,
    alive: true,
    debut: 1992,
    championships: 24,
    movies: 2,
    unique_tv_shows: 0,
    billed_weight: 290,
  },

  {
    name: 'Triple H',
    age: 49,
    alive: true,
    debut: 1992,
    championships: 23,
    movies: 8,
    unique_tv_shows: 5,
    billed_weight: 255,
  },

  {
    name: 'Big Show',
    age: 47,
    alive: true,
    debut: 1994,
    championships: 24,
    movies: 11,
    unique_tv_shows: 46,
    billed_weight: 383,
  },

  {
    name: 'John Cena',
    age: 41,
    alive: true,
    debut: 1999,
    championships: 23,
    movies: 18,
    unique_tv_shows: 24,
    billed_weight: 251,
  },

  {
    name: 'Steven Richards',
    age: 47,
    alive: true,
    debut: 1992,
    championships: 21,
    movies: 0,
    unique_tv_shows: 0,
    billed_weight: 220,
  },

  {
    name: 'Bubba Ray Dudley',
    age: 47,
    alive: true,
    debut: 1991,
    championships: 20,
    movies: 0,
    unique_tv_shows: 5,
    billed_weight: 280,
  },

  {
    name: 'Rey Mysterio',
    age: 44,
    alive: true,
    debut: 1989,
    championships: 20,
    movies: 1,
    unique_tv_shows: 5,
    billed_weight: 175,
  },

  {
    name: 'Christian',
    age: 45,
    alive: true,
    debut: 1995,
    championships: 20,
    movies: 5,
    unique_tv_shows: 5,
    billed_weight: 212,
  },

  {
    name: 'Goldust',
    age: 49,
    alive: true,
    debut: 1988,
    championships: 20,
    movies: 2,
    unique_tv_shows: 0,
    billed_weight: 232,
  },

  {
    name: 'Jeff Hardy',
    age: 41,
    alive: true,
    debut: 1993,
    championships: 19,
    movies: 0,
    unique_tv_shows: 4,
    billed_weight: 225,
  },
  
]

computer_hand = []
user_hand = []

# The Computer will randomly seperate the WRESTLERS into two Hands; one for the User one for the Computer

def details(arr)
  computer_hand = []
  user_hand = []
  arr.each_with_index do |arr, index|
    if index.even?
      user_hand << arr 
    else
      computer_hand << arr
    end
  end
  puts "Your Wrestlers are; #{user_hand[0][:name]}, "
  puts "Your first wrestler is #{user_hand[0][:name]}"
  puts "Here are his attributes;"
  puts "Age: #{user_hand[0][:age]}"
  puts "Alive?: #{user_hand[0][:alive]}"
  puts "Debut: : #{user_hand[0][:debut]}"
  puts "Championships: #{user_hand[0][:championships]}"
  puts "Number of movie apperances: #{user_hand[0][:movies]}"
  puts "Number of TV shows: : #{user_hand[0][:unique_tv_shows]}"
  puts "Billed weight: : #{user_hand[0][:billed_weight]}lbs"

end


details(WRESTLERS)

# The Hands will be stored in an Hash, and used in a round in order starting from the first Index Position



# The User will get the option to select a Key Value Pair from the object in first Index position 



# A Key Value Pair list will be presented in the Terminal


# The user will select their choice by inputting the number next to each Key Value Pair


# The Computer will compare its first card's attributes against the attriutbes the User has selected


# The winner will be the highest of the two numbers unless stated above


# The winner will take the others card and it will be added to the back of the pile


# If there is a draw the User will keep selecting until someone wins the round


# The winner is the player to collect all 16 cards
