import 'dart:io';
import 'dart:math';

void main() {
  List<String> choices = ['gunting', 'batu', 'kertas'];

  var random = Random();
  String computerChoice = choices[random.nextInt(choices.length)];

  stdout.write('Pilih (gunting/batu/kertas): ');
  String? userChoice = stdin.readLineSync()?.toLowerCase();

  if (userChoice == null || !choices.contains(userChoice)) {
    print('input yang benar!!');
    return;
  }

  print('Komputer memilih: $computerChoice');
  print('Kamu memilih: $userChoice');

  if (userChoice == computerChoice) {
    print('Seri!');
  } else if (
      (userChoice == 'gunting' && computerChoice == 'kertas') ||
      (userChoice == 'batu' && computerChoice == 'gunting') ||
      (userChoice == 'kertas' && computerChoice == 'batu')) {
    print('menang!');
  } else {
    print('kalah!');
  }
}