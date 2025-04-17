import 'package:flutter_riverpod/flutter_riverpod.dart';

final configProvider = Provider<String>((ref) {
  return 'Config ~ v1.0.0';
});
