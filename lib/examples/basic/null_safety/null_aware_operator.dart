import 'package:try_dart/types/errors/error.dart';

/// Dart の Null aware operators についてのサンプルです.
///
/// - https://dart.dev/codelabs/dart-cheatsheet#null-aware-operators
Error? nullAwareOperator() {
  // null safety 機能によって、null許容とマークされている型の値を利用するためには
  // nullかどうかをチェックしないといけなくなった。
  //
  // それを簡便にするために null aware operators がある
  // null aware operators は、その値がnullの場合に○○するという動作を楽にするための
  // シンタックスシュガーである.
  int? v1;

  // 上の v1 の値は null となっている
  // 以下の ??= を利用すると値がnullの場合に右辺の値を設定してくれる
  print(v1);
  v1 ??= 10;
  print(v1);

  // null ではない状態で再度やってみると、コンパイルは成功するが以下の警告がでる
  // 「Warning: Operand of null-aware operation '??=' has type 'int' which excludes null.」
  // つまり、Dart は、ちゃんと上で値が設定されていることを認識している
  // (ちなみに JetBrains IntelliJ IDEA などでも警告表示してくれる)
  //
  // そのため、以下は値が設定されることはない
  // v1 ??= 100; // ignore: dead_null_aware_expression
  // print(v1);

  // 同じような利用方法で使えるのが ?? である
  int? v2;
  print(v2 ?? 10);

  return null;
}
