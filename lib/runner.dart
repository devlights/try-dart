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
      if (err is NotFound) {
        stdout.writeln('not found...try again');
        continue;
      }

      if (err is CandidatesFound) {
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

Error? _build() {
  examples.build(_map);
}

Error? _run(String name) {
  var candidates = _map.candidates(name);

  // there is no candidate.
  if (candidates.isEmpty) {
    return NotFound();
  }

  // there is multiple candidates. choice it.
  if (candidates.length > 1) {
    stdout.writeln('There is ${candidates.length} candidates.');

    for (var e in candidates) {
      stdout.writeln('${e.name}');
    }

    return CandidatesFound();
  }

  // there is only one candidate. execute it.
  var exec = candidates.first;

  stdout.writeln('[INPUT  ]: $name');
  stdout.writeln('[EXAMPLE]: ${exec.name}');
  stdout.writeln('=============== START ===============');

  try {
    return exec.target();
  } finally {
    stdout.writeln('===============  END  ===============');
  }
}
