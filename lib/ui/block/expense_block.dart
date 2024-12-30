import 'package:expence_app/data/local/db_helper.dart';
import 'package:expence_app/ui/block/expense_event.dart';
import 'package:expence_app/ui/block/expense_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseBloc extends Bloc<ExpenseEvent,ExpenseState>{
  DBHelper dbHelper;
  ExpenseBloc({required this.dbHelper}):super(ExpenseInitialState()){
    on<AddExpenseEvent>((event,emit)async{
      emit(ExpenseLoadingState());
      bool check=await dbHelper.addExpense(event.newExpense);
      if(check){
        var allExp=await dbHelper.getAllExpense();
        emit(ExpenseLoaddedState(expData: allExp));
      }else{
        emit(ExpenseErrorState(errorMsg: "Expense cannot be added"));
      }
    });
    on<FetchInitialExpenseEvent>((event,emit)async{
      emit(ExpenseLoadingState());

        var allExp=await dbHelper.getAllExpense();
        emit(ExpenseLoaddedState(expData: allExp));

    });
  }
}
