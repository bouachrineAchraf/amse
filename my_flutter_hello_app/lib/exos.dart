import 'dart:io';

void main() {
  // print("What's your name?");
  // String? name = stdin.readLineSync();
  // print("How old are you, $name?");
  // String? age = stdin.readLineSync();

  // int vraiAge = int.parse(age!);
  // print("How old are you, $age?");

  // var agetolive = 100 - vraiAge;
  //  print("Hi ${name} ou still have ${agetolive}");

  // print("write a number :");
  // String? num1 = stdin.readLineSync();
  // int vrainum = int.parse(num1!);
  // if(vrainum % 2 == 0){
  //   print("this number is and zawji");
  // }
  // else {
  //   print("this number is and fardi");
  // }
//   var numbers = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];

// for (int number in numbers) {
//   if(number <5){
//     print(number);
//   }
// }
  print("What's your name?");
  String name = stdin.readLineSync()!;
  int c = 0;
  int comp = name.length - 1;
  print(comp);
  for (int i = 0; i < name.length; i++) {
    if (name[i] != name[comp - i]) {
      c++;
    }
  }
  if (c == 0) {
    print("c'est un palindrome");
  } else {
    print("non c'est pas un palindrome");
  }
}
