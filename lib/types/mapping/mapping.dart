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

  List<Candidate> candidates(String target) {
    var r = <Candidate>[];

    if (target.isEmpty) {
      return r;
    }

    for (var e in m.entries) {
      if (e.key.isNotEmpty && e.key.contains(target)) {
        r.add(Candidate(name: e.key, target: e.value));
      }
    }

    return r;
  }
}

class Candidate {
  final String name;
  final error? Function() target;

  Candidate({required this.name, required this.target});
}
