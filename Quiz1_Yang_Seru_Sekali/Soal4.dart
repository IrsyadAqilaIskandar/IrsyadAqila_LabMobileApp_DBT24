import 'dart:io';

bool isPrima(int n) {
  if (n < 2) return false;
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) return false;
  }
  return true;
}

void main() {
  stdout.write('masukkan angka: ');
  String? input = stdin.readLineSync();
  if (input == null || int.tryParse(input) == null) {
    print('input salah.');
    return;
  }

  int angka = int.parse(input);
  bool hasil = isPrima(angka);
  print('angka $angka adalah prima $hasil');
}