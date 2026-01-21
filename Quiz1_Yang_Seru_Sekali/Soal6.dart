import 'dart:io';
import 'dart:math';

class account {
  int balance = 0;
  
  void deposit(int amount){
   balance += amount;
  }

  void withdraw(int amount){
    if (balance - amount >= 0){
      balance-=amount;
    } else {
      print('Saldo tidak cukup');
    }
  }
}
void main() {
  account Account = account();
  stdout.write('masukkan saldo awal: ');
  Account.balance = int.parse(stdin.readLineSync()!);

  stdout.write('masukkan jumlah deposit: ');
  int depositAmount = int.parse(stdin.readLineSync()!);
  Account.deposit(depositAmount);

  stdout.write('masukkan jumlah withdraw: ');
  int withdrawAmount = int.parse(stdin.readLineSync()!);
  Account.withdraw(withdrawAmount);

  print('Balance= ${Account.balance}');

}