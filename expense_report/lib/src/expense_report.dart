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
      processExpense(expense, (meal, total) {
        mealExpenses += meal;
        totalExpenses += total;
      });
    }
    log('Meal Expenses: $mealExpenses');
    log('Total Expenses: $totalExpenses');
  }

  void processExpense(Expense expense, void Function(int, int) updateExpenses) {
    var mealAmount = 0;
    var totalAmount = 0;

    if (expense.type == ExpenseType.dinner || expense.type == ExpenseType.breakfast) {
      mealAmount = expense.amount;
    }

    final String expenseName = switch (expense.type) {
      ExpenseType.dinner => 'Dinner',
      ExpenseType.breakfast => 'Breakfast',
      ExpenseType.carRental => 'Car Rental',
    };

    final mealOverExpensesMarker = isOverExpensed(expense) ? 'X' : ' ';
    log('$expenseName\t${expense.amount}\t$mealOverExpensesMarker');
    totalAmount = expense.amount;

    updateExpenses(mealAmount, totalAmount);
  }

  bool isOverExpensed(Expense expense) =>
      (expense.type == ExpenseType.dinner && expense.amount > 5000) || (expense.type == ExpenseType.breakfast && expense.amount > 1000);

  void log(Object? object) => ApprovalLogger.log(object.toString());
}
