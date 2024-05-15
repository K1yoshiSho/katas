part of '../expense_report.dart';

enum ExpenseType {
  dinner,
  breakfast,
  carRental,
  lunch;
}

mixin MealExpense on Service {
  int get expenseLimit;

  bool get isOverLimit => amount > expenseLimit;
}

abstract class Service {
  final int amount;

  const Service({required this.amount});

  String get name;
  bool get isMeal => this is MealExpense;
}

class Breakfast extends Service with MealExpense {
  static const String _name = 'Breakfast';
  static const int _expenseLimit = 1000;

  const Breakfast({
    required super.amount,
  });

  @override
  int get expenseLimit => _expenseLimit;

  @override
  String get name => _name;
}

class CarRental extends Service {
  static const String _name = 'Car Rental';

  const CarRental({
    required super.amount,
  });

  @override
  String get name => _name;
}

class Dinner extends Service with MealExpense {
  static const String _name = 'Dinner';
  static const int _expenseLimit = 5000;

  const Dinner({
    required super.amount,
  });

  @override
  int get expenseLimit => _expenseLimit;

  @override
  String get name => _name;
}

class Lunch extends Service with MealExpense {
  static const String _name = 'Lunch';
  static const int _expenseLimit = 2000;

  const Lunch({
    required super.amount,
  });

  @override
  int get expenseLimit => _expenseLimit;

  @override
  String get name => _name;
}

class Expense {
  final ExpenseType type;
  final int amount;

  const Expense({
    required this.type,
    this.amount = 0,
  });

  Service get service => switch (type) {
        ExpenseType.breakfast => Breakfast(amount: amount),
        ExpenseType.lunch => Lunch(amount: amount),
        ExpenseType.dinner => Dinner(amount: amount),
        ExpenseType.carRental => CarRental(amount: amount),
      };
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

  void _writeExpenses(List<Service> services) {
    for (final service in services) {
      _writeExpenseLineFor(service);
    }
  }

  void _writeTotalsFor(List<Service> services) {
    final mealExpenses = _calculateMealExpenses(services);
    final totalExpenses =
        services.fold<int>(0, (total, service) => total + service.amount);

    log('Meal Expenses: $mealExpenses');
    log('Total Expenses: $totalExpenses');
  }

  int _calculateMealExpenses(List<Service> services) {
    final meals = services.where((service) => service.isMeal);
    return meals.fold(0, (total, service) => total + service.amount);
  }

 void _writeExpenseLineFor(Service service) {
    final overLimitIndicator = (service is MealExpense && service.isOverLimit) ? 'X' : ' ';
    log('${service.name}\t${service.amount}\t$overLimitIndicator');
  }

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
