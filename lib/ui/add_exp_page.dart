import 'package:expence_app/data/local/db_helper.dart';
import 'package:expence_app/data/local/models/expense_modele.dart';
import 'package:expence_app/domain/app_constants.dart';
import 'package:expence_app/domain/ui_helper.dart';
import 'package:expence_app/main.dart';
import 'package:expence_app/ui/block/expense_block.dart';
import 'package:expence_app/ui/block/expense_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class AddExpPage extends StatefulWidget {
  @override
  State<AddExpPage> createState() => _AddExpPageState();
}

class _AddExpPageState extends State<AddExpPage> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descController = TextEditingController();

  TextEditingController amtController = TextEditingController();

  String selectedExpenseType = "Debit";

  int selectedCatIndex = -1;

  List<String> mExpenseType = ["Debit", "Credit", "Loan", "Lend", "Borrow"];

  DateTime selectedDate = DateTime.now();
  DateFormat mFormat = DateFormat.yMMMd();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Expense"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration:
                    mTextDecoration(hint: "Enter title here", heading: "Title"),
              ),
              mSpacer(),
              TextField(
                controller: descController,
                decoration: mTextDecoration(
                    hint: "Enter desc here", heading: "Description"),
              ),
              mSpacer(),
              TextField(
                controller: amtController,
                decoration: mTextDecoration(
                    hint: "Enter Amount here", heading: "Amount"),
              ),
              mSpacer(),

              /// expense type
              DropdownMenu(
                  width: double.infinity,
                  inputDecorationTheme: InputDecorationTheme(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                          borderSide: BorderSide(width: 2))),
                  initialSelection: selectedExpenseType,
                  onSelected: (value) {
                    selectedExpenseType = value ?? "Debit";
                  },
                  dropdownMenuEntries: mExpenseType.map((expenseType) {
                    return DropdownMenuEntry(
                        value: expenseType, label: expenseType);
                  }).toList()),

              mSpacer(),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return Container(
                          child: GridView.builder(
                              itemCount: AppConstants.mCat.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4),
                              itemBuilder: (_, index) {
                                return InkWell(
                                  onTap: () {
                                    selectedCatIndex = index;
                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        AppConstants.mCat[index].imgPath,
                                        height: 40,
                                        width: 40,
                                      ),
                                      Text(
                                        AppConstants.mCat[index].title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                );
                              }),
                        );
                      });
                },
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      border: Border.all(width: 1, color: Colors.black)),
                  child: Center(
                    child: selectedCatIndex >= 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Image.asset(
                                  AppConstants.mCat[selectedCatIndex].imgPath,
                                  width: 40,
                                  height: 40,
                                ),
                                Text(
                                    " - ${AppConstants.mCat[selectedCatIndex].title}")
                              ])
                        : Text("Choose Category"),
                  ),
                ),

                /*StatefulBuilder(builder: (_,ss){
               return ;
               return  DropdownButton(
                   value: selectedExpenseType,
                   items: mExpenseType.map((expenseType){
                     return DropdownMenuItem(child: Text(expenseType),value: expenseType,);
                   }).toList(),

                   [
                     DropdownMenuItem(child: Text("Debit"),value: "Debit",),
                     DropdownMenuItem(child: Text("Credit"),value: "Credit",),
                   ],
                   onChanged:(value){
                     selectedExpenseType=value ?? "Debit";
                     ss((){});
                   });
             }),*/
              ),

              InkWell(
                onTap: () async {
                  /// for iphone
                 /* if (Platform.isIOS || Platform.isMacOS) {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (_) {
                          return CupertinoDatePicker(
                            
                              minimumDate: DateTime.now().subtract(Duration(days: 365)),
                              minimumYear: DateTime.now().year-1,
                              maximumYear: DateTime.now().year,
                              maximumDate: DateTime.now().add(Duration(hours: 1)),
                              onDateTimeChanged: (selectedValue){
                              selectedDate=selectedValue;

                              Navigator.pop(context);
                              });
                        });
                  } else {*/
                    selectedDate=await showDatePicker(
                      context: context,
                      firstDate: DateTime(DateTime.now().year - 1),
                      lastDate: DateTime.now(),
                    ) ?? DateTime.now();

                  //}
                  setState(() {

                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      border: Border.all(width: 1, color: Colors.black)),
                  child: Center(
                    child: Text(mFormat.format(selectedDate).toString()),
                  ),
                ),

                /*StatefulBuilder(builder: (_,ss){
               return ;
               return  DropdownButton(
                   value: selectedExpenseType,
                   items: mExpenseType.map((expenseType){
                     return DropdownMenuItem(child: Text(expenseType),value: expenseType,);
                   }).toList(),

                   [
                     DropdownMenuItem(child: Text("Debit"),value: "Debit",),
                     DropdownMenuItem(child: Text("Credit"),value: "Credit",),
                   ],
                   onChanged:(value){
                     selectedExpenseType=value ?? "Debit";
                     ss((){});
                   });
             }),*/
              ),

              mSpacer(),
              OutlinedButton(
                onPressed: () async {
                  if (titleController.text.isNotEmpty &&
                      descController.text.isNotEmpty &&
                      amtController.text.isNotEmpty &&
                      selectedCatIndex > -1) {
                    var prefs = await SharedPreferences.getInstance();
                    String uId = prefs.getString("userId") ?? "";

                    context.read<ExpenseBloc>().add(AddExpenseEvent(
                        newExpense: ExpenseModele(
                            expenseType: selectedExpenseType,
                            userId: int.parse(uId),
                            title: titleController.text,
                            desc: descController.text,
                            createdAt: selectedDate
                                .millisecondsSinceEpoch
                                .toString(),
                            amount: double.parse(amtController.text),
                            balance: 0.0,
                            cat_id: AppConstants.mCat[selectedCatIndex].id)));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Expense Added"),
                      backgroundColor: Colors.green,
                    ));
                    Navigator.pop(context);

                    //DBHelper dbHelper = DBHelper.getInstance;

                    //bool check=await dbHelper.addExpense();

                    /*if(check){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Expense Added"),backgroundColor: Colors.green,));
                      Navigator.pop(context);
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error Adding Expense"),backgroundColor: Colors.red,));

                    }*/
                  }
                },
                child: Text("Add Expense"),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(21),
                    ),
                    minimumSize: Size(double.infinity, 60)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
