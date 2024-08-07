# stack_trace_info

The `stack_trace_info` package provides a simple yet powerful way to parse and extract detailed information from Dart stack traces. This package helps developers retrieve file paths, line numbers, column numbers, class names, and method names from stack traces, facilitating easier debugging and error handling.

## Getting started

To start using the `stack_trace_info` package, add it to your `pubspec.yaml`:

```yaml
dependencies:
  stack_trace_info: ^latest_version
```


```dart
void main() {
  final StackTraceInfo info = StackTraceInfo(trace: StackTrace.current);
  log(info.fileName);
}
```

