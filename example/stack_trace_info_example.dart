import 'dart:developer';

import 'package:stack_trace_info/stack_trace_info.dart';

void main() {
  final StackTraceInfo info = StackTraceInfo(trace: StackTrace.current);
  log(info.fileName);
}
