require './lib/dog'

max = Dog.new("Max")
puts max.woof

## Describe what each part of the code above did -
# `max` => is a new instance of dog
# `Dog` => Dog is a class
# `.woof` => Calls the #woof method of the max instance of Dog

puts Dog.woof

## Is there any difference between the two methods above? (max.woof and Dog.woof)?

## Un-comment the line of code below, does it work? Why or why not?
Dog.bark

