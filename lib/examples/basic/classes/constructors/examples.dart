import 'package:try_dart/examples/basic/classes/constructors/named.dart';
import 'package:try_dart/examples/basic/classes/constructors/optional.dart';
import 'package:try_dart/examples/basic/classes/constructors/positional.dart';
import 'package:try_dart/types/mapping/mapping.dart';

void build(ExampleMapping map) {
  map.add('basic_classes_constructors_positional', positional);
  map.add('basic_classes_constructors_optional', optional);
  map.add('basic_classes_constructors_named', named);
}
