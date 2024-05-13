import 'package:expense_report/expense_report.dart';

import 'expense_report_test.dart';

void main() {
  runApprovalTests(input);
}

void runApprovalTests(List<Expense> input) {
  final TestableExpenseReport expenseReport = TestableExpenseReport();
  final DateTime date = DateTime(2022, 9, 1, 0, 0, 0, 0, 0);

  expenseReport.printReport(input, date: date);
  // Approvals.saveApprovedCase(expenseReport.logs.join('\n'), filePath: "approved_cases.txt");
}
