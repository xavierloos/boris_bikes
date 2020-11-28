![](https://placehold.it/950x200/374c53/FFFFFF/?text=Boris+Bikes)

Transport for London, the body responsible for delivery of a new bike system, come to you with a plan: a network of docking stations and bikes that anyone can use. They want you to build a program that will emulate all the docking stations, bikes, and infrastructure (repair staff, and so on) required to make their dream a reality.

## From User Stories to a Domain Model

### User Story

```
As a user,
I can use a bike,
I can release a bike from the docking station.
```

```
As a user,
I can use a bike in excelent conditions,
I need to check if the bike is working
```

### Write down all the nouns in the User Story

```
User can use a bike. I want to release a bike from the docking station.
User can use a good bike, I need to check the bike is working.
```

### Write down all the verbs in the User Stories

```
User can use a bike, I can release bike from the docking station.
User can use a bike in good conditions, check first if it's working.
```

### Organise the nouns and verbs into Objects and Messages

| OBJECT         | MESSAGE      | RESPONSE   |
| -------------- | ------------ | ---------- |
| User           |              |            |
| Bike           | is working?  | TRUE/FALSE |
| DockingStation | Release_bike | BIKE       |

### Draw a diagram that shows how your Objects will use Messages to communicate with one another

<img src="https://github.com/xavierloos/boris_bikes/blob/main/users_diagram.png">

## From a Domain Model to a Feature Test

We have an _NameError_ because we don't have initialize the class DockingStation so the program doesn't reconize this.

```
2.7.0 :001 > docking_station = DockingStation.new
Traceback (most recent call last):
        4: from /Users/jlr/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `<main>'
        3: from /Users/jlr/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `load'
        2: from /Users/jlr/.rvm/rubies/ruby-2.7.0/lib/ruby/gems/2.7.0/gems/irb-1.2.1/exe/irb:11:in `<top (required)>'
        1: from (irb):1
NameError (uninitialized constant DockingStation)
```

## Errors are good

### Type of error

```
NameError
```

### Write down the file path where the error happened

```
4: from /Users/jlr/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `<main>'
```

### Write down the line number of the error

In the irb the line number is 1

```
 1: from (irb):1
```

### Use the Ruby Documentation to find out what the error means

**NameError:** Raised when a given name is invalid or undefined.

### Suggest one way of solving the error.

- Create a class on the ruby.
- Require the ruby file path in the irb.
- Now, create a new instance of that class.

## Passing your first Unit Test

In _./lib/DockingStation.rb_

```
#I create the main class
class DockingStation
end
```

in _./spec/docking_station_spec.rb_

```
require "DockingStation" #I link the file rb and I dont need the full path only the name
#The describe check if I have the class DockingStation in the rb file
describe DockingStation do
end

```

## Back to the feature

```
irb
2.7.0 :001 > require "./lib/DockingStation"
 => true
2.7.0 :002 > docking_station = DockingStation.new
2.7.0 :003 > bike = docking_station.release_bike
Traceback (most recent call last):
        4: from /Users/jlr/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `<main>'
        3: from /Users/jlr/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `load'
        2: from /Users/jlr/.rvm/rubies/ruby-2.7.0/lib/ruby/gems/2.7.0/gems/irb-1.2.1/exe/irb:11:in `<top (required)>'
        1: from (irb):3
NoMethodError (undefined method `release_bike' for #<DockingStation:0x00007fe9f989c7c8>)
```

## Back to the unit

### Add a test to your spec file that expects DockingStation instances to respond_to the method release_bike

```
it "respond to the method release_bike" do
    expect(subject).to respond_to :release_bike
end
```

### Rewrite this test using RSpec's one-liner syntax

```
# it "respond to the method release_bike" do
#   expect(subject).to respond_to :release_bike
# end
it{is_expected.to respond_to :release_bike} #One-liner syntax
```

### Run RSpec from the Command Line

```
rspec
F

Failures:

  1) DockingStation is expected to respond to #release_bike
     Failure/Error: it { is_expected.to respond_to :release_bike } #One line syntax
       expected #<DockingStation:0x00007fa18593ebe8> to respond to :release_bike
     # ./spec/docking_station_spec.rb:6:in `block (2 levels) in <top (required)>'

Finished in 0.05318 seconds (files took 0.11656 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/docking_station_spec.rb:6 # DockingStation is expected to respond to #release_bike
```

### Explain the error to your pair partner

The **NameError** is not yet initialize in the main file rb, therefore the error marks that it cannot be found in the main class.

### Add a method release_bike to the DockingStation class

```
def release_bike
end
```

### Run RSpec from the Command Line

```
.

Finished in 0.0076 seconds (files took 0.12337 seconds to load)
1 example, 0 failures
```

### Explain to your pair partner the difference between what you see, and the error you saw before.

Now that we add the method release_bike is indeed found in the class and it doesn't give an error.

## Building a bike

- Start irb

```
irb
```

- Instantiate a DockingStation as docking_station

```
2.7.0 :001 > require "./lib/DockingStation"
 => true
2.7.0 :002 > docking_station = DockingStation.new
```

- Ask docking_station to release a bike, and save the response to a variable bike

```
2.7.0 :003 > bike = docking_station.release_bike
2.7.0 :004 > bike #Check what I have in my var
 => nil
```

- Ask the bike if it is working?

```
2.7.0 :005 > bike.working?
Traceback (most recent call last):
        4: from /Users/jlr/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `<main>'
        3: from /Users/jlr/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `load'
        2: from /Users/jlr/.rvm/rubies/ruby-2.7.0/lib/ruby/gems/2.7.0/gems/irb-1.2.1/exe/irb:11:in `<top (required)>'
        1: from (irb):5
NoMethodError (undefined method `working?' for nil:NilClass)
```

- Explain the error to your pair partner
  Our method _working?_ doesn't exist or is been written wrong.
- Create a new spec file for a Bike class
  In ./spec/bike_spec.rb
- Set up the spec file to describe the Bike class

```
describe Bike do
end
```

- Run RSpec from the Command Line

```
rspec

An error occurred while loading ./spec/bike_spec.rb.
Failure/Error:
  describe Bike do
  end

NameError:
  uninitialized constant Bike
# ./spec/bike_spec.rb:1:in `<top (required)>'


Finished in 0.00003 seconds (files took 0.19951 seconds to load)
0 examples, 0 failures, 1 error occurred outside of examples
```

- Fix the error you see, similarly to how you fixed the same error for DockingStation
  In ./spec/bike_spec.rb

```
require "Bike"
```

In ./lib/Bike.rb

```
class Bike
end
```

- Add a test to your bike_spec.rb file that expects Bike instances to respond_to the method working?
  In ./spec/bike_spec.rb

```
it { is_expected(subject).to respond_to :wokring? }
```

and from the command line I have this error

```
F.

Failures:

  1) Bike is expected to respond to #working?
     Failure/Error: it { is_expected.to respond_to :working? }
       expected #<Bike:0x00007fd0c418b108> to respond to :working?
     # ./spec/bike_spec.rb:3:in `block (2 levels) in <top (required)>'

Finished in 0.0332 seconds (files took 0.11949 seconds to load)
2 examples, 1 failure

Failed examples:

rspec ./spec/bike_spec.rb:3 # Bike is expected to respond to #working?
```

- Make this test pass.
  In ./lib/Bike.rb

```
 def working?
  end
```
