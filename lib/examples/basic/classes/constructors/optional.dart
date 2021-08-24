import 'package:try_dart/types/errors/error.dart';

Error? optional() {
  final obj1 = _Optional('hello');
  final obj2 = _Optional('world', 99);

  print(obj1);
  print(obj2);

  return null;
}

class _Optional {
  String name = '';
  int? age;

  _Optional(String name, [int? age = 44]) {
    this.name = name;
    this.age = age;
  }

  @override
  String toString() {
    return 'name=$name,age=$age';
  }
}
