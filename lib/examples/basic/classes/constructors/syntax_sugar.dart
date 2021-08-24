import 'package:try_dart/types/errors/error.dart';

error? syntaxSugar() {
  final obj1 = _SyntaxSugar('hello', 99);

  [obj1].forEach(print);

  return null;
}

/// https://dart.dev/guides/language/language-tour#constructors
class _SyntaxSugar {
  String name;
  int age;

  _SyntaxSugar(this.name, this.age);

  @override
  String toString() {
    return 'name=$name,age=$age';
  }
}
