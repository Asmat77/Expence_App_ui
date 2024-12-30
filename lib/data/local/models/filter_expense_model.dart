import 'package:expence_app/data/local/models/expense_modele.dart';

class FilterExpenseModel{

  String typeName;
  num totalAmt;
  List<ExpenseModele> allExpenses;
  FilterExpenseModel({required this.typeName,required this.totalAmt,required this.allExpenses});


}