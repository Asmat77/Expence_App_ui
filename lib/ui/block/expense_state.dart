import 'package:expence_app/data/local/models/expense_modele.dart';

abstract class ExpenseState{}
class ExpenseInitialState extends ExpenseState{}
class ExpenseLoadingState extends ExpenseState{}
class ExpenseLoaddedState extends ExpenseState{
  List<ExpenseModele> expData;
  ExpenseLoaddedState({required this.expData});
}
class ExpenseErrorState extends ExpenseState{
  String errorMsg;
  ExpenseErrorState({required this.errorMsg});
}
