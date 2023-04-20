import 'package:get/get.dart';

class TicTacToeController extends GetxController {
  RxBool oTurn = true.obs;
  RxString turn = ''.obs;
  RxList turns = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ].obs;

//On Tapping the Grid Container

  void onTap(int index) {
    if (turns[index] != '') {
      return;
    } else if (turns[index] == '') {
      if (oTurn.value) {
        turns[index] = 'O';
        turn.value = 'X';
      } else {
        turns[index] = 'X';
        turn.value = 'O';
      }
      oTurn.value = !oTurn.value;
    }
  }

  //On Reset
  void Reset() {
    turns.value = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ].toList();
  }
}
