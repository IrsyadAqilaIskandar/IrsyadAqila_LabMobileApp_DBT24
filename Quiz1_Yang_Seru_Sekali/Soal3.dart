import 'dart:io';
import 'dart:math';

void main () {
  final random = Random();
  int randChoice = random.nextInt(100) + 1;
  stdout.write('masukkan angka antara 1 - 100: ');
  String? input = stdin.readLineSync();
  int userchoice = int.parse(input!);

  if (userchoice == randChoice) {
    print('benar');
  } else {
    print('salah');
    print('angka yang benar adalah $randChoice');
  }
}