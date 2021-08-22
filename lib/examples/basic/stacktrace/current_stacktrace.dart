import 'package:try_dart/types/errors/error.dart';

error? currentStackTrace() {
  _f1();

  return null;
}

void _f1() {
  _f2();
}

void _f2() {
  StackTrace.current.toString().split('\n').sublist(0, 3).forEach(print);
}
