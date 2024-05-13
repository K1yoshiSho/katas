part of '../expense_report.dart';

class ExpenseReport {
  void printReport(
    List<Expense> expenses, {
    required DateTime date,
  }) {
    var mealExpenses = 0;
    var totalExpenses = 0;

    log('Expense Report: $date');
    for (final expense in expenses) {
      if (expense.type == ExpenseType.dinner || expense.type == ExpenseType.breakfast) {
        mealExpenses += expense.amount;
      }
    }
    for (final expense in expenses) {
      writeExpenseLineFor(expense);
      totalExpenses += expense.amount;
    }
    log('Meal Expenses: $mealExpenses');
    log('Total Expenses: $totalExpenses');
  }

  void writeExpenseLineFor(Expense expense) => log('${expense.type.name}\t${expense.amount}\t${isOverExpensed(expense) ? 'X' : ' '}');

  bool isOverExpensed(Expense expense) =>
      expense.type == ExpenseType.dinner && expense.amount > 5000 || expense.type == ExpenseType.breakfast && expense.amount > 1000;

  void log(Object? object) => ApprovalLogger.log(object.toString());
}
