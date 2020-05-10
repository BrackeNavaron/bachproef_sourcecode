
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Sample Unit Test", (){
    //Arrange
    final c = Calculator();
    //Act
    final value = c.addNumbers(2, 2);
    //Assert
    expect(4, value);
  });
}

class Calculator {
  const Calculator();

  int addNumbers(int a, int b) => a+b;
}