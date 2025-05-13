import 'dart:io';
import 'dart:math';

import 'tttGSG.dart';

class Game {
  String currentPlayer = '';
  bool showHint = false;
  List<String> list = ['', '', '', '', '', '', '', '', ''];

  //this is the function that run the game
  void runGame() {
    bool computerMode = playersNum == 1;

    print(
      "you can moves  by typing the number of the position you want to move into",
    );
    currentPlayer = players[0];

    if (hint()) {
      for (int a = 0; a < 9; a++) {
        if (computerMode) {
          // if the remainder of division on 2!=0 then it is the computer turn
          if (a % 2 != 0) {
            int position;

            do {
              position = Random().nextInt(9);
            } while (list[position] != '');

            list[position] = currentPlayer;
            print("Computer decision");
          } else {
            // if the remainder of division on 2=0 then it is the player turn

            try {
              getInput();
            } catch (E) {
              print("pleas enter a number from 1 to 9 and not repeated");
              currentPlayer == 'X' ? currentPlayer = 'O' : currentPlayer = "X";

              a--;
            }
          }
        } else {
          //in this case it's player vs player mode
          try {
            getInput();
          } catch (E) {
            print("pleas enter a number from 1 to 9 and not repeated");
            currentPlayer == 'X' ? currentPlayer = 'O' : currentPlayer = "X";

            a--;
          }
        }

        printList();

          //this Check if someone win or not
        if (win(currentPlayer)) {
          print("$currentPlayer winning");
          print(
            "if you want to play again enter r \ to move into the mine mnue enter m",
          );
          String decision = stdin.readLineSync()!.toUpperCase() ?? "M";
          if (decision == "R") {
            list = ['', '', '', '', '', '', '', '', ''];
            runGame();
          } else {
            list = ['', '', '', '', '', '', '', '', ''];
            Main().mainMenu();
          }
          break;
        } else if (a == 8 && !win(currentPlayer)) {
          print("no one win ( Draw )");
          print(
            "if you want to play again enter r \ to move into the mine mnue enter m",
          );
          String decision = stdin.readLineSync()!.toUpperCase() ?? "M";
          if (decision == "R") {
            list = ['', '', '', '', '', '', '', '', ''];
            runGame();
          } else {
            list = ['', '', '', '', '', '', '', '', ''];
            Main().mainMenu();
          }
          break;
        } else {
          currentPlayer == 'X' ? currentPlayer = 'O' : currentPlayer = "X";
        }
      }
    } else
      runGame();
  }

  //print the current list
  void printList() {
    print(' ${list[0]} | ${list[1]} | ${list[2]} ');
    print('--+--+--');
    print(' ${list[3]} | ${list[4]} | ${list[5]} ');
    print('--+--+--');
    print(' ${list[6]} | ${list[7]} | ${list[8]} ');
  }

  //Check if one of players won
  bool win(String player) {
    if ((list[0] == player && list[1] == player && list[2] == player) ||
        (list[3] == player && list[4] == player && list[5] == player) ||
        (list[6] == player && list[7] == player && list[8] == player) ||
        (list[0] == player && list[3] == player && list[6] == player) ||
        (list[1] == player && list[4] == player && list[7] == player) ||
        (list[2] == player && list[5] == player && list[8] == player) ||
        (list[0] == player && list[4] == player && list[8] == player) ||
        (list[2] == player && list[4] == player && list[6] == player)) {
      return true;
    }
    return false;
  }

  //show a hint when it's your first time to play the game
  bool hint() {
    if (showHint == false) {
      print('1|2|3');
      print('-+-+-');
      print('4|5|6');
      print('-+-+-');
      print('7|8|9');
      print("\n it's Ok? \n type p to run the game");
      String s = stdin.readLineSync()!.toUpperCase() ?? '';
      showHint = true;
      return s == "P";
    }
    return true;
  }

  //this method take the position number from the player
  getInput() {
    {
      print("$currentPlayer Enter the position's number from 1 to 9");
      String s = stdin.readLineSync() ?? '2';

      int position = int.parse(s);

      if (list[position - 1] == '') {
        list[position - 1] = currentPlayer;
      } else {
        throw Error();
      }
      if (position < 1 || position > 9) {
        throw Error();
      }
    }
  }
}
