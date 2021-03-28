import 'package:TodoApp/until/validate.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Empty text test', () {
    var result = Validator.validateText("");
    expect(result, 'Please enter some text');
  });
  test('Valid text test', () {
    var result = Validator.validateText('Working on every day');
    expect(result, null);
  });
}
