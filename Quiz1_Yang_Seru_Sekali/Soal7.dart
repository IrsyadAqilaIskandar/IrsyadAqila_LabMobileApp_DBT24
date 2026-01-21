void main () {
  List<int> a = [1,3,5,7];
  List<int> b = [2,4,6,8];
  List<int> c = [...a, ...b];

  c.sort();

  print('hasil gabungan = $c ')
  print(c[c.length - 2]);
}