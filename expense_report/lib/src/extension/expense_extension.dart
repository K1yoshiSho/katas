part of '../../expense_report.dart';

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
