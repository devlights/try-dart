import 'package:try_dart/types/errors/error.dart';

error? namedOptional() {
  final obj1 = _NamedOptional('hello');
  final obj2 = _NamedOptional('world', age: 88);

  [obj1, obj2].forEach(print);

  return null;
}

class _NamedOptional {
  String name = '';
  int age = 0;

  _NamedOptional(String name, {int age = 99}) {
    this.name = name;
    this.age = age;
  }

  @override
  String toString() {
    return 'name=$name,age=$age';
  }
}
