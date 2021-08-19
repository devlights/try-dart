import 'package:try_dart/types/errors/error.dart';

/// Dart の Sound null safety についてのサンプルです.
///
/// - https://dart.dev/null-safety
error? nullSafety() {
  final v = _intOrNull();

  // v の型は int? となっている.
  // null-safetyがオンの場合、この値は null かどうかを
  // チェックしないと利用できない
  //
  // つまり、以下はコンパイルエラーとなる
  // _p(v); // The argument type 'int?' can't be assigned to the parameter type 'int'
  // 利用する場合は null かどうかをチェックしないといけない
  if (v != null) {
    _p(v); // これはOK
  }

  // もしくは、以下のように変換してしまっても良い
  _p(v ?? 0);

  // 中の値が「絶対に」nullではないと分かっている場合は以下のようにしても良い
  _p(v!);

  // 逆に null許容 とマークしていない型に対して null を設定することも出来ない
  // 以下はコンパイルエラーとなる
  // int v3 = null; // A value of type 'Null' can't be assigned to a variable of type 'int'

  return null;
}

/// この関数は int or null を返すことを戻り値で表明している
/// 型名の後ろに ? をつけると null を許容するという意味となる
int? _intOrNull() {
  return 10;
}

void _p(int v) {
  print(v);
}
