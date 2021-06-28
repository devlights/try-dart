import 'dart:io';

import 'package:try_dart/examples.dart' as examples;

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    stderr.writeln('need example name... try again.');
    return;
  }

  print(arguments[0]);
  examples.exec();
}
