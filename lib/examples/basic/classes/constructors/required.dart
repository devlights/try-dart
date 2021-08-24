import 'package:try_dart/types/errors/error.dart';

Error? withRequired() {
  final obj1 = _WithRequired(name: 'hello', age: 99);
  final obj2 = _WithRequired2('world', age: 88);
  final obj3 = _WithRequired2('helloworld', age: 77, memo: 'hello-world');

  [obj1, obj2, obj3].forEach(print);

  return null;
}

class _WithRequired {
  final String name;
  final int age;

  /// Dart で最もよく見るパターンのコンストラクタ
  /// {} を付与することでパラメータ指定時に named parameter を強制し
  /// required を付与することで必須項目指定もする
  _WithRequired({required this.name, required this.age});

  @override
  String toString() {
    return 'name=$name,age=$age';
  }
}

class _WithRequired2 {
  final String name;
  final int age;
  final String memo;

  /// 組み合わせ
  /// this.name は positional (暗黙で required)
  /// this.age は named and required
  /// this.memo は named and optional
  _WithRequired2(this.name, {required this.age, this.memo = ''});

  @override
  String toString() {
    return 'name=$name,age=$age,memo=$memo';
  }
}
