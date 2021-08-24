import 'package:try_dart/types/mapping/mapping.dart';

import 'classes/constructors/examples.dart' as classes;
import 'helloworld/examples.dart' as helloworld;
import 'null_safety/examples.dart' as nullsafety;
import 'stacktrace/examples.dart' as stacktrace;
import 'strings/examples.dart' as strings;

void build(ExampleMapping map) {
  classes.build(map);
  helloworld.build(map);
  nullsafety.build(map);
  stacktrace.build(map);
  strings.build(map);
}
