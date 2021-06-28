import 'dart:io';

class error {
  final String message;
  error(this.message);
}

class notfound extends error {
  notfound() : super('not found');
}

var _map = <String, error? Function()>{};

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

error? helloworld() {
  print('hello world');
  return null;
}

error? _build() {
  _map['basic_helloworld'] = helloworld;
}

error? _run(String target) {
  if (!_map.containsKey(target)) {
    return notfound();
  }

  var fn = _map[target];
  if (fn != null) {
    return fn();
  }

  return null;
}
