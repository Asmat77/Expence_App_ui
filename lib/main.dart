
import 'package:expence_app/data/local/db_helper.dart';
import 'package:expence_app/domain/app_constants.dart';
import 'package:expence_app/ui/block/expense_block.dart';
import 'package:expence_app/ui/on_boarding/login_page.dart';
import 'package:expence_app/ui/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



void main(){
  runApp(BlocProvider(create: (_)=>ExpenseBloc(dbHelper: DBHelper.getInstance),child: MyApp(),));
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.APP_NAME,
      home: SplashScreen(),
    );
  }
}
