import 'package:expense_report/expense_report.dart';
import 'package:expense_report/src/models/base/expense.dart';
import 'package:expense_report/src/models/base/meal_expende.dart';
import 'package:expense_report/src/models/expense_types/breakfast.dart';
import 'package:expense_report/src/models/expense_types/car_rental.dart';
import 'package:expense_report/src/models/expense_types/dinner.dart';
import 'package:expense_report/src/models/expense_types/lunch.dart';

extension ExpenseExtension on Expense {
  Service get service => switch (type) {
        ExpenseTypeEnum.breakfast => Breakfast(amount: amount),
        ExpenseTypeEnum.lunch => Lunch(amount: amount),
        ExpenseTypeEnum.dinner => Dinner(amount: amount),
        ExpenseTypeEnum.carRental => CarRental(amount: amount),
      };
}

extension ServiceExtension on Service {
  bool get isMeal => this is MealExpense;
}
