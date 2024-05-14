import 'package:approval_tests/approval_tests.dart';
import 'package:expense_report/expense_report.dart';
import 'package:test/test.dart';

const input = [
  Expense(type: ExpenseTypeEnum.dinner, amount: 1),
  Expense(type: ExpenseTypeEnum.breakfast, amount: 2),
  Expense(type: ExpenseTypeEnum.carRental, amount: 4),
  Expense(type: ExpenseTypeEnum.dinner, amount: 5000),
  Expense(type: ExpenseTypeEnum.dinner, amount: 5001),
  Expense(type: ExpenseTypeEnum.breakfast, amount: 1000),
  Expense(type: ExpenseTypeEnum.breakfast, amount: 1001),
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
