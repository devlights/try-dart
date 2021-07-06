import 'package:try_dart/types/errors/error.dart';

error? nullAwareOperator() {
  final s = _getS();
  final l = s?.trim().toUpperCase();

  print(l);
  
  return null;
}

String? _getS() {
  return '   hello dart   ';
}
