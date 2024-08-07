/// The [StackTraceInfo] class provides detailed information about a stack trace.
class StackTraceInfo {
  /// Constructs a [StackTraceInfo] object with the given stack trace.
  ///
  /// The stack trace is required to parse and extract detailed information.
  const StackTraceInfo({
    required StackTrace trace,
  }) : _trace = trace;

  /// The stack trace from which information is extracted.
  final StackTrace _trace;

  /// Retrieves the file information from the stack trace.
  ///
  /// This includes the file path, line number, and column number.
  /// Returns a list of strings containing the file path, line number, and column number.
  List<String> get fileInfo {
    final String traceString = _trace.toString().split('\n')[0];
    final int indexOfFile = traceString.indexOf(RegExp(r'file://'));
    return traceString.substring(indexOfFile + 'file://'.length).split(':');
  }

  /// Retrieves the file name from the stack trace.
  ///
  /// Returns the file name as a string.
  String get fileName {
    return fileInfo[0];
  }

  /// Retrieves the line number from the stack trace.
  ///
  /// Returns the line number as an integer.
  int get lineNumber {
    return int.parse(fileInfo[1]);
  }

  /// Retrieves the column number from the stack trace.
  ///
  /// Returns the column number as an integer.
  int get columnNumber {
    return int.parse(fileInfo[2].replaceAll(')', ''));
  }

  /// Retrieves the class name from the stack trace, if available.
  ///
  /// Returns the class name as a string, or `null` if the class name cannot be determined.
  String? get className {
    final String methodInfo = _trace.toString().split('\n')[0];
    final List<String> classAndMethod = methodInfo.split('.');
    return classAndMethod.length > 1 && !classAndMethod[1].startsWith('<')
        ? classAndMethod[0].replaceAll('#0', '').replaceAll(' ', '')
        : null;
  }

  /// Retrieves the method name from the stack trace, if available.
  ///
  /// Returns the method name as a string, or `null` if the method name cannot be determined.
  String? get methodName {
    final String methodInfo = _trace.toString().split('\n')[0];
    final List<String> classAndMethod = methodInfo.split('.');
    return classAndMethod.length > 1
        ? classAndMethod[1].startsWith('<')
            ? classAndMethod[0]
                .replaceAll('#0', '')
                .replaceAll(' ', '')
                .substring(
                    0,
                    (classAndMethod[0].indexOf('(') - 1) <= 0
                        ? 0
                        : classAndMethod[0].indexOf('(') - 1)
            : classAndMethod[1]
                .replaceAll('#0', '')
                .replaceAll(' ', '')
                .substring(
                    0,
                    (classAndMethod[1].indexOf('(') - 1) <= 0
                        ? 0
                        : classAndMethod[1].indexOf('(') - 1)
        : null;
  }
}
