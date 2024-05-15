import 'package:approval_tests/approval_tests.dart';
import 'package:expense_report/expense_report.dart';

import 'package:test/test.dart';

const input = [
  Expense(type: ExpenseType.dinner, amount: 1),
  Expense(type: ExpenseType.breakfast, amount: 2),
  Expense(type: ExpenseType.carRental, amount: 4),
  Expense(type: ExpenseType.dinner, amount: 5000),
  Expense(type: ExpenseType.dinner, amount: 5001),
  Expense(type: ExpenseType.breakfast, amount: 1000),
  Expense(type: ExpenseType.breakfast, amount: 1001),
  Expense(type: ExpenseType.lunch, amount: 1001),
  Expense(type: ExpenseType.lunch, amount: 2001),
];
void main() {
  late final ExpenseReport expenseReport;
  late final TestableConsolePrinter consolePrinter;
  final DateTime date = DateTime(2022, 9);

  group('ExpenseReport', () {
    setUp(() {
      consolePrinter = TestableConsolePrinter();
      expenseReport = ExpenseReport(printer: consolePrinter);
      
    });

    test('printReport', () {
      expenseReport.printReport(input, date: date);
      Approvals.verify(
        consolePrinter.output,
        options: const Options(
          comparator: IDEComparator(ide: ComparatorIDE.visualStudioCode),
        ),
      );
    });
  });
}


final class TestableConsolePrinter extends ConsolePrinter {
  final List<String> _logs = [];
  
  @override
  void print(Object? object) {
    _logs.add(object.toString());
  }

  String get output => _logs.join('\n');
}
