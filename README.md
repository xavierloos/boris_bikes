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
