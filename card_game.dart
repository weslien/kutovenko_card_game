import 'dart:io';

const String PASSPHRASE = 'y'; /// Strange choice to name this PASSPHRASE. Feels like it was copy & pasted.

void main() {
  Game game = Game();
  game.intro();
}

class Player {
  final String name;
  final List<String> cards; /// This should have a default empty list, to save the developer some effort. You might also have considered modelling
                            /// Deck and Card classes. Perhaps not strictly necessary, but would simplify encapsultion of specifiuc business logic 
                            /// and validation. Also, what happens to the final list if we were to deal an additional card after showing the cards?

  Player({required this.name, required this.cards}) {}
}

class Game {
  List<Player> players = [];

  //Let's pretend I asked the team and the team decided that we use a deck of 10 cards and all of them are spades.
  //Here could be card generator of course, but not now, sorry.
  
  /// So, here the business logic of the deck and cards is inline in the Game class. The choice of having only 1-10 of spades instead of A-K of 
  /// hearts, diamonds, clubs and spades just feels lazy. While there is a reasoning behind it, I really don't understand it. The least controversial
  /// choice would have been a standard deck of 52 cards. 
  /// Additionally, typing sequences of numbers isn't great.
  /*
  Using constructs like these woiuld have been preferrable:
  
  List<int> cardIndex = List.generate(14, (index) => index + 1); 
  =>
  [1,2,3,4,5,6,7,8,9,10,11,12,13,14]
  
  Map valuesLongMap = {'1': 'Ace', '11': 'Jack', '12': 'Queen', '13': 'King'};
  List<String> suits = ['Hearts', 'Diamonds', 'Spades', 'Clubs'];
  Map suitsMap = {'Hearts': '♥', 'Diamonds': '♦', 'Spades': '♠', 'Clubs': '♣'};
  
  From these you could then easily have generated any number and combinations of decks, cards, etc.
  
  Many card games utilize several decks.
  
  */
  final List<String> deckOfCards = [
    '1 of spades',
    '2 of spades',
    '3 of spades',
    '4 of spades',
    '5 of spades',
    '6 of spades',
    '7 of spades',
    '8 of spades',
    '9 of spades',
    '10 of spades'
  ];

  void _startGame(int numberOfPlayers, int numberOfCards) {
    players = List.generate(
        numberOfPlayers, (index) => Player(name: 'Player $index', cards: [])); /// This is good, perhaps 

    _validate(numberOfPlayers, numberOfCards)
        ? _giveCards(numberOfCards)
        : print('We are doomed!');
  }

  void intro() {
    //Let's pretend we live in ideal world where users will input only int numbers,
    // not letters, doubles, etc. If we are still on Earth,
    // here should be input validation task for upcoming sprint.
    // First for QA engineer, if we have one, and then for developer.

    /// We don't have any QA Engineers, nor will we. Developers should write working code
    /// and automated tests (also written by developers) should verify this. Always sanitize and validate input.
    
    
    
    /* This code would have been more readable something like this:
      
      int numOfPlayers = _readInt('Please, print a number of players:');
      int numOfPlayers = _readInt('Please, print number of cards per player:')
      
      int _readInt(String message){
        print(message);
        return int.parse(stdin.readLineSync()!);
        
      }
      
      */
    print('Print \'$PASSPHRASE\' to start a game or \'q\' to exit');
    if (stdin.readLineSync() == PASSPHRASE) {
      print('Please, print a number of players:');
      int numOfPlayers = int.parse(stdin.readLineSync()!);

      print('Please, print number of cards per player:');
      int numOfCards = int.parse(stdin.readLineSync()!);
    
      
      
      
      _startGame(numOfPlayers, numOfCards);
    } else if (stdin.readLineSync() == 'q') {
      return;
    } else {
      print('We are doomed!'); //...or some kind of fancy custom Exception
      /// While it is obvious you intentionally simplified, the amount of extra effort required to make it understandable is negligible. 
    }
  }

  void _giveCards(int numberOfCards) { /// commonly known as _dealCards
    print('Shuffling cards...');
    deckOfCards.shuffle();
    print('Ready!');
    final len = deckOfCards.length;

    final playerCards = [];

    /// This is not really how you deal cards. You go player by player, dealing each a card from the top of the deck, 
    /// until all players have the correct number of cards.
    
    for (int i = 0; i < len; i += numberOfCards) {
      var end = (i + numberOfCards < len) ? i + numberOfCards : len;
      playerCards.add(deckOfCards.sublist(i, end));
    }

    /// This is pretty unreadable and most of us needed to put in extra effort to make sense of it.
    for (int i = 0; i < players.length; i++) {
      players[i].cards.addAll(playerCards[i]);
    }

    _printStash(players); /// Strange naming choice
    intro();
    /* Call stack would be
      main()
        Game.intro()
          Game._startGame()
            Game._giveCards()
              Game.intro()
                Game._startGame()
                  Game._giveCards()
                    Game.intro()
                      etc... infinitely recursive stack
    
    */
    
  }

  void _printStash(List<Player> players) {
    for (Player player in players) {
      print('${player.name} cards: ${player.cards}');
    }
  }

  bool _validate(int numberOfPlayers, int numberOfCards) {
    //Here can be a lot of validations. Let it be just one.
    if (deckOfCards.length >= (numberOfCards * numberOfPlayers)) {
      return true;
    }
    return false;
  }
}


/// In general, sadly, not great. Feels a bit nonchalant.
