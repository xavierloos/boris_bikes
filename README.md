![](https://placehold.it/950x200/374c53/FFFFFF/?text=Boris+Bikes)

Transport for London, the body responsible for delivery of a new bike system, come to you with a plan: a network of docking stations and bikes that anyone can use. They want you to build a program that will emulate all the docking stations, bikes, and infrastructure (repair staff, and so on) required to make their dream a reality.

## User Story
```
As a user,
I can use a bike,
I can release a bike from the docking station.
```
```
As a user,
I can use a bike in excelent conditions,
I need to check if the bike is working
````
## Write down all the nouns in the User Story
```
User can use a bike. I want to release a bike from the docking station.
User can use a good bike, I need to check the bike is working.
```
## Write down all the verbs in the User Stories
```
User can use a bike, I can release bike from the docking station.
User can use a bike in good conditions, check first if it's working.
```

## Organise the nouns and verbs into Objects and Messages

| OBJECT | MESSAGE |RESPONSE|
|--------|---------|--------|
|User|||
|Bike|is working?|TRUE/FALSE|
|DockingStation|Release_bike|BIKE|

## Draw a diagram that shows how your Objects will use Messages to communicate with one another
<img src="https://github.com/xavierloos/boris_bikes/blob/main/users_diagram.png">

## From a Domain Model to a Feature Test
We have an *NameError* because we don't have initialize the class DockingStation so the program doesn't reconize this.
```
2.7.0 :001 > docking_station = DockingStation.new
Traceback (most recent call last):
        4: from /Users/jlr/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `<main>'
        3: from /Users/jlr/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `load'
        2: from /Users/jlr/.rvm/rubies/ruby-2.7.0/lib/ruby/gems/2.7.0/gems/irb-1.2.1/exe/irb:11:in `<top (required)>'
        1: from (irb):1
NameError (uninitialized constant DockingStation)
```