import 'package:try_dart/types/errors/error.dart';

class ExampleMapping {
  final m = <String, error? Function()>{};

  void add(String target, error? Function() fn) {
    m[target] = fn;
  }

  error? Function()? get(String target) {
    if (m.containsKey(target)) {
      return m[target];
    }

    return null;
  }
}
