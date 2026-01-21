void main() {
  perfect(28);
  perfect(10);
  perfect(6);
}

void perfect(nilai){
  int initial = 0;
  for (int i =1; i < nilai; i++){
    if (nilai % i == 0){
      initial += i;
    }
  }
  if (initial == nilai){
    print("true");

  } else {
    print("false");
  }
}