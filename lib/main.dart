import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getasan_app/app.dart';
import 'package:getasan_app/configs/config_state_dialog.dart';

void main() {
  runApp(const ProviderScope(child: App()));
  configStateDialog();
}
