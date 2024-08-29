import 'package:basic_01_helloworld/basic_01_helloworld.dart';
import 'package:test/test.dart';

void main() {
  test('message', () {
    expect(message, 'hello world');
  });
  test('getMessage', () {
    expect(getMessage(), 'HELLO WORLD');
  });
}
