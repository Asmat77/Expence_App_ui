// ignore_for_file: prefer_const_constructors

import 'package:expence_app/data/local/models/expense_modele.dart';
import 'package:expence_app/data/local/models/filter_expense_model.dart';
import 'package:expence_app/domain/app_constants.dart';
import 'package:expence_app/ui/add_exp_page.dart';
import 'package:expence_app/ui/block/expense_block.dart';
import 'package:expence_app/ui/block/expense_event.dart';
import 'package:expence_app/ui/block/expense_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DateFormat mFormat =DateFormat.yMMMM();
  List<ExpenseModele> mExpense = [];
  List<FilterExpenseModel> filteredDate = [];
  List<String> mDurationType=["Monthly","Yearly"];
  String selectedDurationType="Monthly";


  @override
  void initState() {
    super.initState();
    context.read<ExpenseBloc>().add(FetchInitialExpenseEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),

            /// Row Monety text and search icon.
            Row(
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/images (1) expense.jpeg"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 9,
                    child: Text(
                      "Monety",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                    )),
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.search_rounded,
                    size: 35,
                  ),
                )
              ],
            ),

            ///Profile name and picture
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                //for image
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          image: AssetImage("assets/images/downloadasa.png"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Morning",
                      style: TextStyle(color: Colors.black.withOpacity(.5)),
                    ),
                    Text(
                      "Asmat Shah",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                )),

               DropdownMenu(
                   initialSelection: selectedDurationType,
                   onSelected: (value){
                     selectedDurationType=value ?? "Monthly";
                   },
                   dropdownMenuEntries: mDurationType.map((durationtype){
                 return DropdownMenuEntry(value: durationtype, label: durationtype);

               }).toList()),
                /*DropdownMenuItem(child: Container(
                  height: 35,
                  width: 110,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.1),
                      borderRadius: BorderRadius.circular(7)),
                  // ignore: prefer_const_constructors
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "This month",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 30,
                      )
                    ],
                  ),
                )),*/
              ],
            ),

            /// Colorful Container for Expense detail.
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  color: Color(0xff6574D3),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Expense Total",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text(
                    "\$ 2,734",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 35,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text("+\$240",
                                style: TextStyle(color: Colors.white))),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "than last month",
                        style: TextStyle(color: Colors.white.withOpacity(.7)),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Expense List",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child:
                  BlocBuilder<ExpenseBloc, ExpenseState>(builder: (_, state) {
                if (state is ExpenseLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ExpenseErrorState) {
                  return Center(
                    child: Text(state.errorMsg),
                  );
                } else if (state is ExpenseLoaddedState) {
                  filterDataDatewise(allExp: state.expData);

                  return state.expData.isNotEmpty
                      ? ListView.builder(
                          itemCount: filteredDate.length,
                          itemBuilder: (_, index) {
                            // var allExp = state.expData;
                            return Container(
                                margin: EdgeInsets.only(bottom: 11),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(9),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.5),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                filteredDate[index].typeName,
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                filteredDate[index]
                                                    .totalAmt
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Divider(),
                                          ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: filteredDate[index]
                                                  .allExpenses
                                                  .length,
                                              shrinkWrap: true,
                                              itemBuilder: (_, childIndex) {
                                                return ListTile(
                                                  leading: Image.asset(
                                                      AppConstants.mCat
                                                          .where((exp) {
                                                            return exp.id ==
                                                                filteredDate[
                                                                        index]
                                                                    .allExpenses[
                                                                        childIndex]
                                                                    .cat_id;
                                                          })
                                                          .toList()[0]
                                                          .imgPath),
                                                  title: Text(
                                                    filteredDate[index]
                                                        .allExpenses[childIndex]
                                                        .title,
                                                    style:
                                                        TextStyle(fontSize: 17),
                                                  ),
                                                  subtitle: Text(filteredDate[
                                                          index]
                                                      .allExpenses[childIndex]
                                                      .desc),
                                                  trailing: Column(
                                                    children: [
                                                      Text(
                                                        "${mFormat.format(DateTime.fromMillisecondsSinceEpoch(int.parse(filteredDate[index].allExpenses[childIndex].createdAt)))}",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                        filteredDate[index]
                                                            .allExpenses[
                                                                childIndex]
                                                            .amount
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 17,
                                                            color: Colors.red),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                        ])));
                          })
                      : Center(
                          child: Text("Data not available"),
                        );
                }
                return Container();
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddExpPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void filterDataDatewise({required List<ExpenseModele> allExp}) {
    filteredDate.clear();

    ///date
    ///total amount
    ///list of expense

    List<String> uniqueDates = [];
    for (ExpenseModele eachExp in allExp) {
      
      String eachDate = mFormat.format(
          DateTime.fromMillisecondsSinceEpoch(int.parse(eachExp.createdAt)));
      if (!uniqueDates.contains(eachDate)) {
        uniqueDates.add(eachDate);
      }
    }
    for (String eachDate in uniqueDates) {
      num totalAmt = 0.0;
      List<ExpenseModele> eachDateExp = [];

      for (ExpenseModele eachExp in allExp) {
        String expDate = mFormat.format(
            DateTime.fromMillisecondsSinceEpoch(int.parse(eachExp.createdAt)));
        if (eachDate == expDate) {
          eachDateExp.add(eachExp);
          if (eachExp.expenseType == "Debit") {
            totalAmt += eachExp.amount;
          } else {
            totalAmt -= eachExp.amount;
          }
        }
      }

      filteredDate.add(FilterExpenseModel(
          typeName: eachDate, totalAmt: totalAmt, allExpenses: eachDateExp));
    }
    //print(filteredDate[2].allExpenses.length);
  }
}
