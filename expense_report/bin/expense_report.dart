import 'package:expense_report/expense_report.dart';

void main(List<String> arguments) {
  var expenseReport = ExpenseReport();
  expenseReport.printReport(
    [
      Expense(ExpenseType.dinner, 1),
      Expense(ExpenseType.breakfast, 2),
      Expense(ExpenseType.carRental, 4),
      Expense(ExpenseType.dinner, 5000),
      Expense(ExpenseType.dinner, 5001),
      Expense(ExpenseType.breakfast, 1000),
      Expense(ExpenseType.breakfast, 1001),
    ],
    date: DateTime.now(),
  );
}
