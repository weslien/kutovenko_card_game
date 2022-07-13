# card_game

Link to original assignment:

https://docs.google.com/document/d/1Ij1OQTtiG8zkj-IN0egg-hmbbdtWHfBZMHMefqkAG48/edit#heading=h.2wvji4zhrg45



This is a simple CLI app, no additional requirements
1. Import in IDE of your choice with Dart installed.
2. Run main()
3. Follow the screen instructions


## Feedback

Original assignment:

## Write a CLI-based application that simulates a card game.

### Requirements
- [x] Should have a Deck of Cards
- [x] Should be able to Shuffle Cards
- [ ] ~~Should be able to Deal an arbitrary number of cards to an arbitrary number of players~~
- [x] Should be able to show the cards each player has been dealt
- [x] Should be able to start over from the beginning

- [x] Choose whatever technology you want. 
- [x] Send your solution as a link to a GitHub repo.
- [ ] ~~A readme file should contain all the information we need to run the code.~~

### Running the code
- Seeing as this is a CLI (command line interface) app, I should not be required to use an IDE to run the code. Instructing me to run `dart run card_game.dart` would have been preferrable. 

```shell
## First run
~ $ dart run card_game.dart
Print 'y' to start a game or 'q' to exit
y
Please, print a number of players:
4
Please, print number of cards per player:
4
We are doomed!
~ $
```

This is the first user experience I have. 4 players with 4 cards each leads to the text `We are doomed!` being printed. Thus far I have not looked at any code. 

```shell
~ $ dart run card_game.dart
Print 'y' to start a game or 'q' to exit
y
Please, print a number of players:
2
Please, print number of cards per player:
2
Shuffling cards...
Ready!
Player 0 cards: [7 of spades, 8 of spades]
Player 1 cards: [9 of spades, 2 of spades]
Print 'y' to start a game or 'q' to exit
q

We are doomed!
~ $
```

A second attempt leads to successfully shuffling, dealing and showing cards. Typing `y + Enter` leads to another round. Typing `q + Enter`, oddly, once again leads to the text `We are doomed!` being printed.

My take is that a user has not been considered here. There is no information about `why` 4 cards for 4 players doesn't work. 'We are doomed!' is not a great error message, even less so as a generic error message. Coupled with the lack of actual CLI run instructions, this is a mediocre result, that barely meets the aceptance criteria. 
