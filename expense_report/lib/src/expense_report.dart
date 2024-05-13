part of '../expense_report.dart';

class ExpenseReport {
  void printReport(
    List<Expense> expenses, {
    required DateTime date,
  }) {
    var mealExpenses = 0;
    var totalExpenses = 0;

    log('Expense Report: $date');
    for (var expense in expenses) {
      if (expense.type == ExpenseType.dinner ||
          expense.type == ExpenseType.breakfast) {
        mealExpenses += expense.amount;
      }
      String expenseName = switch (expense.type) {
        ExpenseType.dinner => 'Dinner',
        ExpenseType.breakfast => 'Breakfast',
        ExpenseType.carRental => 'Car Rental',
      };

      var mealOverExpensesMarker = isOverExpensed(expense) ? 'X' : ' ';
      log('$expenseName\t${expense.amount}\t$mealOverExpensesMarker');
      totalExpenses += expense.amount;
    }
    log('Meal Expenses: $mealExpenses');
    log('Total Expenses: $totalExpenses');
  }

  bool isOverExpensed(Expense expense) =>
      expense.type == ExpenseType.dinner && expense.amount > 5000 ||
      expense.type == ExpenseType.breakfast && expense.amount > 1000;

  void log(Object? object) => print(object.toString());
}
