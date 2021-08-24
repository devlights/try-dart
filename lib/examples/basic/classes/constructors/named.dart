import 'package:try_dart/types/errors/error.dart';

error? named() {
  final obj1 = _Named('hello');
  final obj2 = _Named('world', age: 99);

  [obj1, obj2].forEach(print);

  return null;
}

class _Named {
  String name = '';
  int? age;

  _Named(String name, {int? age}) {
    this.name = name;
    this.age = age;
  }

  @override
  String toString() {
    return 'name=$name,age=$age';
  }
}
