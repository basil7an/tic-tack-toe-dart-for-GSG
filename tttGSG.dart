import 'dart:io';

import 'game.dart';

int? playersNum;
List<String> players = [];

class Main {
  void mainMenu() {
    print("Main Menu");
    print("Do you want to play against your friend or against the PC?");
    print("if you want to play against a frind enter 1");
    print("if you want to play against the PC enter 2");
    String? input = stdin.readLineSync();
    int? gameMode = int.tryParse(input ?? '');
    playersNum = gameMode ?? 2;
    chooseMarker();
  }

  List markers = ['X', 'x', 'O', 'o'];
  bool markerIsCorrect = false;
  void chooseMarker() {
    print("Main menu \n\n ");

    print(
      "Choose your marker X or O\n The second player will automatically get the opposite marker ",
    );

    String? name = stdin.readLineSync()!.toUpperCase();

    if (markers.contains(name)) {
      markerIsCorrect = true;
    } else {
      print("Please enter a valide marker name X or O");
      chooseMarker();
    }

    //this add the two players to the list
    players.add(name);

    players.add(name == 'X' ? 'O' : 'X');

    print("enter s key to start the game");
    String? start;
    try {
      start = stdin.readLineSync()!.toUpperCase();
    } catch (e) {}
    if (start == 'S') {
      print("player ${players[0]} will play now");
      new Game().runGame();
    }
  }
}

void main(List<String> args) {
  Main().mainMenu();
}
