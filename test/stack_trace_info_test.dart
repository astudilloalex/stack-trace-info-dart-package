import 'package:stack_trace_info/stack_trace_info.dart';
import 'package:test/test.dart';

void main() {
  group('Stack Trace Info Getters', () {
    test('should extract file information from StackTrace', () {
      final StackTraceInfo info = StackTraceInfo(trace: StackTrace.current);

      final List<String> fileInfo = info.fileInfo;
      expect(fileInfo, isNotEmpty);
      expect(fileInfo.length, greaterThanOrEqualTo(3));
    });

    test('should return correct file name', () {
      final StackTraceInfo info = StackTraceInfo(trace: StackTrace.current);

      final String fileName = info.fileName;
      expect(fileName, isNotNull);
      expect(fileName, isNot(contains('file://')));
    });

    test('should return correct line number', () {
      final StackTraceInfo info = StackTraceInfo(trace: StackTrace.current);

      final int lineNumber = info.lineNumber;
      expect(lineNumber, isNotNull);
      expect(lineNumber, greaterThan(0));
    });

    test('should return correct column number', () {
      final StackTraceInfo info = StackTraceInfo(trace: StackTrace.current);

      final int columnNumber = info.columnNumber;
      expect(columnNumber, isNotNull);
      expect(columnNumber, greaterThan(0));
    });

    test('should return correct class name', () {
      final StackTraceInfo info = StackTraceInfo(trace: StackTrace.current);

      final String? className = info.className;
      expect(className, isNull);
    });

    test('should return correct method name', () {
      final StackTraceInfo info = StackTraceInfo(trace: StackTrace.current);

      final String? methodName = info.methodName;
      expect(methodName, isNotNull);
      expect(methodName, equals('main'));
    });
  });
}
