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

  List<MapEntry<String, error? Function()>> candidates(String target) {
    var r = <MapEntry<String, error? Function()>>[];

    for (var e in m.entries) {
      if (e.key.contains(target)) {
        r.add(e);
      }
    }

    return r;
  }
}
