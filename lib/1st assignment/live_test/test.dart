import 'dart:io';

void triangle() {
  print("Enter the base of the triangle: ");
  double base = double.parse(stdin.readLineSync()!);

  print("Enter the height of the triangle: ");
  double height = double.parse(stdin.readLineSync()!);

  double area = 0.5 * base * height;
  print("The area of the triangle is: $area");
}

main() {
  triangle();
}
