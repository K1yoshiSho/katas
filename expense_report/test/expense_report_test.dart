import 'package:approval_tests/approval_tests.dart';
import 'package:expense_report/expense_report.dart';
import 'package:test/test.dart';

final input = [
  Expense(ExpenseType.dinner, 1),
  Expense(ExpenseType.breakfast, 2),
  Expense(ExpenseType.carRental, 4),
  Expense(ExpenseType.dinner, 5000),
  Expense(ExpenseType.dinner, 5001),
  Expense(ExpenseType.breakfast, 1000),
  Expense(ExpenseType.breakfast, 1001),
];
void main() {
  late TestableExpenseReport expenseReport;
  final DateTime date = DateTime(2022, 9);

  group('ExpenseReport', () {
    setUp(() {
      expenseReport = TestableExpenseReport();
    });

    test('printReport', () {
      expenseReport.printReport(input, date: date);
      Approvals.verify(
        expenseReport.logs.join('\n'),
        options: const Options(
          comparator: IDEComparator(ide: ComparatorIDE.visualStudioCode),
        ),
      );
    });
  });
}

final class TestableExpenseReport extends ExpenseReport {
  final List<String> logs = [];
  @override
  void log(Object? object) {
    logs.add(object.toString());
  }
}
