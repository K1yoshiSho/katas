import 'package:approval_tests/approval_tests.dart';

class Expense {
  final ExpenseType type;
  final int amount;

  const Expense({
    required this.type,
    this.amount = 0,
  });
}

enum ExpenseType {
  dinner,
  breakfast,
  carRental,
  lunch,
}

extension ExpenseExtension on Expense {
  Service get service => switch (type) {
        ExpenseType.breakfast => Breakfast(amount: amount),
        ExpenseType.lunch => Lunch(amount: amount),
        ExpenseType.dinner => Dinner(amount: amount),
        ExpenseType.carRental => CarRental(amount: amount),
      };
}

abstract class Service {
  final int amount;

  const Service({required this.amount});

  String get name;
}

mixin MealExpense on Service {
  int get expenseLimit;

  bool get isOverLimit => amount > expenseLimit;
}

class Breakfast extends Service with MealExpense {
  const Breakfast({required super.amount});

  @override
  int get expenseLimit => 1000;

  @override
  String get name => 'Breakfast';
}

class CarRental extends Service {
  const CarRental({required super.amount});

  @override
  String get name => 'Car Rental';
}

class Dinner extends Service with MealExpense {
  const Dinner({required super.amount});

  @override
  int get expenseLimit => 5000;

  @override
  String get name => 'Dinner';
}

class Lunch extends Service with MealExpense {
  const Lunch({required super.amount});

  @override
  int get expenseLimit => 2000;

  @override
  String get name => 'Lunch';
}

class ExpenseReport {
  void printReport(List<Expense> expenses, {required DateTime date}) {
    _writeHeader(date);
    _writeExpenses(expenses);
    _writeTotals(expenses);
  }

  void _writeHeader(DateTime date) {
    log('Expense Report: $date');
  }

  void _writeExpenses(List<Expense> expenses) {
    for (final expense in expenses) {
      _writeExpenseLine(expense);
    }
  }

  void _writeExpenseLine(Expense expense) {
    final service = expense.service;
    final isOverLimit = service is MealExpense && service.isOverLimit;
    log('${service.name}\t${expense.amount}\t${isOverLimit ? 'X' : ' '}');
  }

  void _writeTotals(List<Expense> expenses) {
    final mealExpenses = _calculateMealExpenses(expenses);
    final totalExpenses =
        expenses.fold(0, (total, expense) => total + expense.amount);
    log('Meal Expenses: $mealExpenses');
    log('Total Expenses: $totalExpenses');
  }

  int _calculateMealExpenses(List<Expense> expenses) => expenses
      .where((expense) => expense.service is MealExpense)
      .fold(0, (total, expense) => total + expense.amount);

  void log(Object? object) => ApprovalLogger.log(object.toString());
}
