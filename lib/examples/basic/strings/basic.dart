import 'package:try_dart/types/errors/error.dart';

/// Dart での 文字列 の基本についてのサンプルです.
error? basic() {
  // Dart の 文字列 は、シングルクォートでもダブルクォートでも同じ
  // だが、ダブルクォートで文字列を生成すると以下の警告が表示される.
  //
  // Only use double quotes for strings containing single quotes
  //
  // シングルクォートを文字列内で利用したい場合だけダブルクォートを使えという意味.
  final s1 = 'helloworld';
  // ignore: prefer_single_quotes
  final s2 = "helloworld";

  print(s1);
  print(s2);
  assert(s1 == s2);

  // マルチライン文字列は シングルクォート3つ、または、ダブルクォート3つとなる
  final s3 = '''
hello
world
  ''';
  print(s3);

  // Raw文字列は r'' または r"" となる
  final s4 = r'hello\tworld';
  print(s4);

  return null;
}
