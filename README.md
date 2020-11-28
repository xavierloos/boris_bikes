![](https://placehold.it/950x200/374c53/FFFFFF/?text=Boris+Bikes)

Transport for London, the body responsible for delivery of a new bike system, come to you with a plan: a network of docking stations and bikes that anyone can use. They want you to build a program that will emulate all the docking stations, bikes, and infrastructure (repair staff, and so on) required to make their dream a reality.

## From User Stories to a Domain Model

- User Story

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

- Write down all the nouns in the User Story

```
User can use a bike. I want to release a bike from the docking station.
User can use a good bike, I need to check the bike is working.
```

- Write down all the verbs in the User Stories

```
User can use a bike, I can release bike from the docking station.
User can use a bike in good conditions, check first if it's working.
```

- Organise the nouns and verbs into Objects and Messages

| OBJECT         | MESSAGE      | RESPONSE   |
| -------------- | ------------ | ---------- |
| User           |              |            |
| Bike           | is working?  | TRUE/FALSE |
| DockingStation | Release_bike | BIKE       |

- Draw a diagram that shows how your Objects will use Messages to communicate with one another

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

- Type of error

```
NameError
```

- Write down the file path where the error happened

```
4: from /Users/jlr/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `<main>'
```

- Write down the line number of the error

In the irb the line number is 1

```
 1: from (irb):1
```

- Use the Ruby Documentation to find out what the error means

**NameError:** Raised when a given name is invalid or undefined.

- Suggest one way of solving the error.

* Create a class on the ruby.
* Require the ruby file path in the irb.
* Now, create a new instance of that class.

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

- Add a test to your spec file that expects DockingStation instances to respond_to the method release_bike

```
it "respond to the method release_bike" do
    expect(subject).to respond_to :release_bike
end
```

- Rewrite this test using RSpec's one-liner syntax

```
# it "respond to the method release_bike" do
#   expect(subject).to respond_to :release_bike
# end
it{is_expected.to respond_to :release_bike} #One-liner syntax
```

- Run RSpec from the Command Line

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

- Explain the error to your pair partner

The **NameError** is not yet initialize in the main file rb, therefore the error marks that it cannot be found in the main class.

- Add a method release_bike to the DockingStation class

```
def release_bike
end
```

- Run RSpec from the Command Line

```
.

Finished in 0.0076 seconds (files took 0.12337 seconds to load)
1 example, 0 failures
```

- Explain to your pair partner the difference between what you see, and the error you saw before.

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

from the console

```
rspec
..

Finished in 0.01341 seconds (files took 0.23496 seconds to load)
2 examples, 0 failures
```

## Making Docking Stations Release Bikes

- Feature-test the feature you are building using irb

```
 irb
2.7.0 :001 > require "./lib/DockingStation"
 => true
2.7.0 :002 > station = DockingStation.new
2.7.0 :003 > bike = station.release_bike
2.7.0 :004 > bike.working?
Traceback (most recent call last):
        4: from /Users/jlr/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `<main>'
        3: from /Users/jlr/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `load'
        2: from /Users/jlr/.rvm/rubies/ruby-2.7.0/lib/ruby/gems/2.7.0/gems/irb-1.2.1/exe/irb:11:in `<top (required)>'
        1: from (irb):4
NoMethodError (undefined method `working?' for nil:NilClass)
```

- Explain the error to your pair partner

release_bike doesn't know what working? as there is not connection between the DockingStation class and the Bike class.

- Add a test to your DockingStation specification that a) gets a bike, and then b) expects the bike to be working

```
# a) gets a bike, and then b) expects the bike to be working
  it "release a bike and expect to be working" do
    bike = subject.release_bike
    expect(bike).to be_working
  end
```

we get an error

```
rspec
..F

Failures:

  1) DockingStation release a bike and expect to be working
     Failure/Error: expect(bike).to be_working
       expected nil to respond to `working?`
     # ./spec/docking_station_spec.rb:10:in `block (2 levels) in <top (required)>'

Finished in 0.05298 seconds (files took 0.23415 seconds to load)
3 examples, 1 failure

Failed examples:

rspec ./spec/docking_station_spec.rb:8 # DockingStation release a bike and expect to be working
```

- Make this test pass

In ./lib/DockingStation.rb

```
#complements the builtin method require by allowing you to load a file that is relative to the file containing the require_relative statement.
require _relative "Bike"

class DockingStation
  def release_bike
    Bike.new #We ask for the class Bike in the Bike file
  end
end
```

In ./lib/Bike.rb

```
 def working?
    true #It need to return true to use the bike
  end
end
```

- Feature-test the feature again.

In irb:

```
irb
2.7.0 :001 > require "./lib/DockingStation"
 => true
2.7.0 :002 > station = DockingStation.new
2.7.0 :003 > bike = station.release_bike
2.7.0 :004 > bike.working?
 => true
```

In rspec:

```
rspec
...

Finished in 0.01733 seconds (files took 0.21152 seconds to load)
3 examples, 0 failures
```

## Using Instance Variables

```
As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station
```

- Write a feature test for docking a bike at a docking station

```
 it "expect a bike to be returned to the station" do
    expect(subject).to respond_to(:station).with(1).argument
  end
```

```
rspec
...F

Failures:

  1) DockingStation expect a bike to be returned to the station
     Failure/Error: expect(subject).to respond_to(:station).with(1).argument
       expected #<DockingStation:0x00007ffcf0146438> to respond to :station with 1 argument
     # ./spec/docking_station_spec.rb:13:in `block (2 levels) in <top (required)>'

Finished in 0.05626 seconds (files took 0.22515 seconds to load)
4 examples, 1 failure

Failed examples:

rspec ./spec/docking_station_spec.rb:12 # DockingStation expect a bike to be returned to the station
```

- Write a unit test for the method you need to add to DockingStation to make docking possible

In ./lib/DockingStation we add a method to our class

```
attr_reader :bike

def station(bike)
    @bike = bike
end
```

- Pass both tests

```
rspec
.....

Finished in 0.01428 seconds (files took 0.12105 seconds to load)
5 examples, 0 failures
```

- Use an instance variable with attr_reader to do a full test-implementation cycle for the second User Story

```
As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked
```

```
it "see a bike that has been docked" do
    bike = Bike.new
    subject.station(bike)
    expect(subject.bike).to eq(bike)
end
```

```
rspec
.....

Finished in 0.01428 seconds (files took 0.12105 seconds to load)
5 examples, 0 failures
```

## Raising Exceptions

- Feature test the feature you are building using irb

```
 irb
2.7.0 :001 > require "./lib/DockingStation"
 => true
2.7.0 :002 > station = DockingStation.new
2.7.0 :003 > station.release_bike
 => #<Bike:0x00007f896192d190>
2.7.0 :004 > station.release_bike
 => #<Bike:0x00007f89619a18d8>
```

- Use {} and raise_error syntax in your RSpec unit test to test exception raising

```
describe "release_bike" do
    it "raise an error if the dock doesn't have a bike" do
      expect { subject.release_bike }.to raise_error "Empty dock"
    end
end
```

- Use the fail or raise keyword to raise an exception in your code (not your tests)

```
def release_bike
    fail "Empty dock" unless @bike
    @bike
end
```

- Make the test pass by raising an exception

```
rspec
.....

Finished in 0.01369 seconds (files took 0.11915 seconds to load)
5 examples, 0 failures
```

- Explain why you use curly braces in the RSpec error handling syntax to your partner

We are chatching the errors and the program stops.

- Feature-test the feature again.

```
rspec
.....

Finished in 0.01685 seconds (files took 0.19608 seconds to load)
5 examples, 0 failures
```

## Limiting capacity

In ./spec/docking_station.rb

```
describe "station" do
    it "raise an error if the dock is full and user want to dock a bike" do
      subject.station(Bike.new)
      expect { subject.station Bike.new }.to raise_error "Dock full"
    end
end
```

In ./lib/DockingStation.rb

```
def release_bike
    fail "Dock empty" unless @bike
    @bike
end
```

```
irb
2.7.0 :001 > require "./lib/DockingStation"
 => true
2.7.0 :002 > dock = DockingStation.new
2.7.0 :003 > dock.station Bike.new
 => #<Bike:0x00007fabd31ce180>
2.7.0 :004 > dock.station Bike.new
Traceback (most recent call last):
        5: from /Users/jlr/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `<main>'
        4: from /Users/jlr/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `load'
        3: from /Users/jlr/.rvm/rubies/ruby-2.7.0/lib/ruby/gems/2.7.0/gems/irb-1.2.1/exe/irb:11:in `<top (required)>'
        2: from (irb):4
        1: from /Users/jlr/Desktop/boris_bikes/lib/DockingStation.rb:13:in `station'
RuntimeError (Dock full)
```

## Wrapping Collections

- Write a manual feature test for the above feature. Consider using 20.times { docking_station.dock Bike.new }.

```
irb
2.7.0 :001 > require "./lib/DockingStation"
 => true
2.7.0 :002 > station = DockingStation.new
2.7.0 :003 > 20.times{station.dock Bike.new}
Traceback (most recent call last):
        7: from /Users/jlr/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `<main>'
        6: from /Users/jlr/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `load'
        5: from /Users/jlr/.rvm/rubies/ruby-2.7.0/lib/ruby/gems/2.7.0/gems/irb-1.2.1/exe/irb:11:in `<top (required)>'
        4: from (irb):3
        3: from (irb):3:in `times'
        2: from (irb):3:in `block in irb_binding'
        1: from /Users/jlr/Desktop/boris_bikes/lib/DockingStation.rb:13:in `dock'
RuntimeError (Dock full)
```

- Rename your attribute @bike to a name better reflecting that it will store more than one Bike instance.

```
 @bikes #change @bike to @bikes
```

- Use rspec to identify areas of your code that need to be updated to use this new attribute name.

```
rspec
...F..

Failures:

  1) DockingStation puts a bike to the station
     Failure/Error: expect(subject.bike).to eq(bike)

     NoMethodError:
       undefined method `bike' for #<DockingStation:0x00007fbf2708d1d8>
     # ./spec/docking_station_spec.rb:18:in `block (2 levels) in <top (required)>'

Finished in 0.01716 seconds (files took 0.23916 seconds to load)
6 examples, 1 failure

Failed examples:

rspec ./spec/docking_station_spec.rb:15 # DockingStation puts a bike to the station
```

- Update your existing tests to recognise this new name for the attribute.

```
it "puts a bike to the station" do
    bikes = Bike.new
    subject.dock(bikes)
    expect(subject.bikes).to eq(bikes)
  end
```

- Use an initialize function to set the initial value of this attribute to a simple collection object: an empty array.

```
def initialize
    @bikes = []
end
```

- Update your release_bike and dock methods to work with this new array (i.e. make your tests pass).

```
 def release_bike
    fail "Dock empty" unless @bikes
    @bikes.pop
  end
```

```
  def dock(bike)
    fail "Dock full" if @bikes
    @bikes << bike
  end
```

- Update your release_bike and dock guard conditions to account for the new capacity of 20 bikes.

```
def release_bike
    fail "Dock empty" if @bikes.empty?
    @bikes.pop
end
```

```
def dock(bike)
    fail "Dock full" if @bikes.size >= 20
    @bikes << bike
end
```
