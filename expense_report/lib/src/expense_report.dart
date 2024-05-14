part of '../expense_report.dart';

class ExpenseReport {
  void printReport(
    List<Expense> expenses, {
    required DateTime date,
  }) {
    _writeHeader(date);

    _writeExpenses(expenses);

    _writeTotalsFor(expenses);
  }

  void _writeHeader(DateTime date) {
    log('Expense Report: $date');
  }

  void _writeExpenses(List<Expense> expenses) {
    expenses.forEach(_writeExpenseLineFor);
  }

  void _writeTotalsFor(List<Expense> expenses) {
    log('Meal Expenses: ${_calculateMealExpenses(expenses)}');
    log('Total Expenses: ${expenses.fold(0, (total, expense) => total + expense.amount)}');
  }

  int _calculateMealExpenses(List<Expense> expenses) {
    int _mealExpenses = 0;
    final meals = expenses.where((expense) => expense.service.isMeal);
    for (final expense in meals) {
      _mealExpenses += expense.amount;
    }
    return _mealExpenses;
  }

  void _writeExpenseLineFor(Expense expense) => log(
        '${expense.type.name}\t${expense.amount}\t${_isOverExpensed(expense) ? 'X' : ' '}',
      );

  bool _isOverExpensed(Expense expense) =>
      expense.type == ExpenseTypeEnum.dinner && expense.amount > 5000 || expense.type == ExpenseTypeEnum.breakfast && expense.amount > 1000;

  void log(Object? object) => ApprovalLogger.log(object.toString());
}
