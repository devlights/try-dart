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

      if (err is candidatesFound) {
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
  var c = _map.candidates(target);
  if (c.isEmpty) {
    return notfound();
  }

  if (c.length > 1) {
    stdout.writeln('There is ${c.length} candidates.');

    for (var e in c) {
      stdout.writeln('${e.key}');
    }

    return candidatesFound();
  }

  // there is only one candidate. execute it.
  var r = c[0].key;

  stdout.writeln('[INPUT  ]: $target');
  stdout.writeln('[EXAMPLE]: $r');
  stdout.writeln('=============== START ===============');

  try {
    var fn = _map.get(r);
    if (fn == null) {
      return notfound();
    }

    return fn();
  } finally {
      stdout.writeln('===============  END  ===============');
  }
}
