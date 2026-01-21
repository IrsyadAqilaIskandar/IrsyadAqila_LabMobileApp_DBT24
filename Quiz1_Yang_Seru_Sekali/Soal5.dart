import 'dart:io';

class Ujian {
  List<int> _nilai = [];

  void tambahNilai(int nilai) {
    _nilai.add(nilai);
  }

  double rataRata() {
    if (_nilai.isEmpty) return 0;
    int total = _nilai.reduce((a, b) => a + b);
    return total / _nilai.length;
  }
}

void main() {
  Ujian ujian = Ujian();

  for (int i = 1; i <= 3; i++) {
    stdout.write('Input nama student: ');
    String? nama = stdin.readLineSync();

    stdout.write('Input nilai $nama: ');
    String? inputNilai = stdin.readLineSync();

    int? nilai = int.tryParse(inputNilai ?? '');
    if (nilai == null) {
      print('masukkan angka.');
      i--;
      continue;
    }

    ujian.tambahNilai(nilai);
  }

  print('Rata rata nilai adalah: ${ujian.rataRata().round()}');
}