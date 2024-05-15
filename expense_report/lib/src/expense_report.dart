part of '../expense_report.dart';

enum ExpenseType {
  dinner,
  breakfast,
  carRental,
  lunch;
}

extension ExpenseExtension on Expense {
  Service get service => switch (type) {
        ExpenseType.breakfast => Breakfast(amount: amount),
        ExpenseType.lunch => Lunch(amount: amount),
        ExpenseType.dinner => Dinner(amount: amount),
        ExpenseType.carRental => CarRental(amount: amount),
      };
}

extension ServiceExtension on Service {
  bool get isMeal => this is MealExpense;
}

mixin MealExpense on Service {
  int get expenseLimit;

  @override
  bool get isOverLimit => amount > expenseLimit;
}

abstract class Service {
  final int amount;

  const Service({required this.amount});

  String get name;
  bool get isOverLimit;
}

class Breakfast extends Service with MealExpense {
  const Breakfast({
    required super.amount,
  });

  @override
  int get expenseLimit => 1000;

  @override
  String get name => 'Breakfast';
}

class CarRental extends Service {
  const CarRental({
    required super.amount,
  });

  @override
  String get name => 'Car Rental';

  @override
  bool get isOverLimit => false;
}

class Dinner extends Service with MealExpense {
  const Dinner({
    required super.amount,
  });

  @override
  int get expenseLimit => 5000;

  @override
  String get name => 'Dinner';
}

class Lunch extends Service with MealExpense {
  const Lunch({
    required super.amount,
  });

  @override
  int get expenseLimit => 2000;

  @override
  String get name => 'Lunch';
}

class Expense {
  final ExpenseType type;
  final int amount;

  const Expense({
    required this.type,
    this.amount = 0,
  });
}

class ExpenseReport {
  final Printer printer;

  const ExpenseReport({
    required this.printer,
  });

  void printReport(
    List<Expense> expenses, {
    required DateTime date,
  }) {
    final services = expenses.map((expense) => expense.service).toList();
    _writeHeader(date);

    _writeExpenses(services);

    _writeTotalsFor(services);
  }

  void _writeHeader(DateTime date) {
    log('Expense Report: $date');
  }

  void _writeExpenses(List<Service> expenses) {
    expenses.forEach(_writeExpenseLineFor);
  }

  void _writeTotalsFor(List<Service> services) {
    log('Meal Expenses: ${_calculateMealExpenses(services)}');
    log('Total Expenses: ${services.fold(0, (total, service) => total + service.amount)}');
  }

  int _calculateMealExpenses(List<Service> services) {
    final meals = services.where((service) => service.isMeal);
    return meals.fold(0, (total, service) => total + service.amount);
  }

  void _writeExpenseLineFor(Service service) => log(
        '${service.name}\t${service.amount}\t${service.isOverLimit ? 'X' : ' '}',
      );

  void log(Object? object) => printer.print(object);
}

abstract interface class Printer {
  void print(Object? object);
}

class ConsolePrinter implements Printer {
  const ConsolePrinter();

  @override
  void print(Object? object) => print(object);
}
