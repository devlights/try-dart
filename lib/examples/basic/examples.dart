import 'package:try_dart/types/mapping/mapping.dart';

import 'helloworld/examples.dart' as helloworld;
import 'null_safety/examples.dart' as nullsafety;
import 'strings/examples.dart' as strings;

void build(ExampleMapping map) {
  helloworld.build(map);
  nullsafety.build(map);
  strings.build(map);
}
