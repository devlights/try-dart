import 'package:try_dart/types/mapping/mapping.dart';

import 'helloworld/examples.dart' as helloworld;
import 'null_safety/examples.dart' as nullsafety;

void build(ExampleMapping map) {
  helloworld.build(map);
  nullsafety.build(map);
}
