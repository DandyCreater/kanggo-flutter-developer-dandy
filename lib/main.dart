import 'package:flutter/material.dart';
import 'package:kanggo_flutter_developer_dandy/app/app.dart';
import 'app/injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}
