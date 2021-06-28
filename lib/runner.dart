import 'dart:io';

import 'examples/examples.dart' as examples;
import 'types/errors/error.dart';
import 'types/mapping/mapping.dart';

var _map = ExampleMapping();

void run(bool onetime) {
  if (_build() != null) {
    stdout.writeln('error at _build()');
    return;
  }

  for (;;) {
    stdout.write('ENTER EXAMPLE NAME: ');

    var line = stdin.readLineSync();
    if (line == null) {
      return;
    }

    if (line.toLowerCase() == 'quit') {
      return;
    }

    var err = _run(line);
    if (err != null) {
      if (err is notfound) {
        stdout.writeln('not found...try again');
        continue;
      }

      stderr.writeln(err.message);
      return;
    }

    if (onetime) {
      return;
    }
  }
}

error? _build() {
  examples.build(_map);
}

error? _run(String target) {
  var fn = _map.get(target);
  if (fn == null) {
    return notfound();
  }

  return fn();
}
