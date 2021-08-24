import 'package:try_dart/types/errors/error.dart';

Error? positional() {
  // 通常のプログラミング言語でよくあるパターンのパラメータ指定
  final obj = _Positional('helloworld', 99);
  print(obj);

  return null;
}

class _Positional {
  // Null-Safetyの場合、初期値を設定するか String? としないと駄目
  // (コンストラクタで required を付与していないので)
  String name = '';
  int age = 0;

  _Positional(String name, int age) {
    this.name = name;
    this.age = age;
  }

  @override
  String toString() {
    return 'name=$name,age=$age';
  }
}
