// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';

final class ApprovalDart {
  static final String _defaultPath = _initializeDefaultPath();

  const ApprovalDart._();

  /// Returns the default instance of ApprovalDart.

  /// Initializes and returns the default path based on the script's directory.
  static String _initializeDefaultPath() {
    Uri scriptUri = Platform.script;
    String scriptPath = scriptUri.toFilePath();
    String directoryPath = scriptPath.substring(0, scriptPath.lastIndexOf('/') + 1);
    return "${directoryPath}approved_cases.json";
  }

  /// Executes tests on all combinations of given input sets.
  static void verifyAllCombinations(List<List<dynamic>> inputSets, void Function(Iterable<List> list) testFunction) {
    Iterable<List> combinations = _cartesianProduct(inputSets);
    testFunction.call(combinations);
  }

  /// Saves approved test cases to a Dart file.
  static void saveApprovedCases(List<dynamic> actualItems, List<dynamic> expectedItems, {String? filePath}) {
    List<Map<String, dynamic>> approvedCases = [];
    for (int i = 0; i < actualItems.length; i++) {
      approvedCases.add({
        "actual": actualItems[i].toJson(),
        "expected": expectedItems[i].toJson(),
      });
    }

    File file = File(filePath ?? _defaultPath);

    var buffer = StringBuffer();
    buffer.writeln("[");
    for (var testCase in approvedCases) {
      buffer.writeln("  ${jsonEncode(testCase)}${testCase == approvedCases.last ? "" : ","}");
    }
    buffer.writeln("]");
    file.writeAsStringSync(buffer.toString());
  }

  /// Loads approved test cases from a Dart file.
  static List<dynamic> loadApprovedCasesIfExists({String? filePath}) {
    late File file = File(filePath ?? _defaultPath);
    if (file.existsSync()) {
      String content = file.readAsStringSync();
      return jsonDecode(content);
    }
    return [];
  }

  /// Checks if the approved test cases file exists.
  static bool isValuesApproved({String? path}) {
    final bool fileExists = File(path ?? _defaultPath).existsSync();
    return fileExists;
  }

  /// Deletes the approved test cases file if it exists.
  static void deleteApprovedCasesIfExists({String? path}) {
    File file = File(path ?? _defaultPath);
    if (file.existsSync()) {
      file.deleteSync();
    }
  }
}

/// Computes the Cartesian product of a list of lists.
Iterable<List<T>> _cartesianProduct<T>(List<List<T>> lists) {
  Iterable<List<T>> result = [[]];
  for (var list in lists) {
    result = result.expand((x) => list.map((y) => [...x, y]));
  }
  return result;
}
