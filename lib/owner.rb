require "pry"
class Owner
  attr_reader :name, :species
	attr_accessor :pets, :name
  @@all = []
  @@count = 0

   def initialize(name)
     @name = name
     @pets = {fishes: [], cats: [], dogs: []}
    # binding.pry
     @@all << self
     @@count += 1
     @species = "human"
   end

   def self.all
       @@all
   end

   def self.reset_all
     @@all.clear
     @@count = 0
   end

   def self.count
     @@count
   end

   def say_species
     "I am a " + self.species + "."
   end

   def buy_fish(name)
     fish = Fish.new(name)
     @pets[:fishes] << fish
   end

   def buy_cat(name)
    cat = Cat.new(name)
     @pets[:cats] << cat
   end

   def buy_dog(name)
     dog = Dog.new(name)
     @pets[:dogs] << dog
  end

   def walk_dogs
     y = @pets[:dogs].each{|dog_obj| dog_obj.mood = "happy"}
   end

   def play_with_cats
     y = @pets[:cats].each{|cat_obj| cat_obj.mood = "happy"}
   end

   def feed_fish
     y = @pets[:fishes].each{|fish_obj| fish_obj.mood = "happy"}
   end

   def sell_pets
     @pets.each{|type, pets| pets.each{|pet_obj| pet_obj.mood = "nervous"}}
     @pets.clear
   end

   def list_pets
     fish_num = @pets[:fishes].count
     dog_num = @pets[:dogs].count
     cat_num = @pets[:cats].count
     "I have #{fish_num} fish, #{dog_num} dog(s), and #{cat_num} cat(s)."
   end

 end
