
import 'package:expence_app/ui/on_boarding/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Color(0xff6574D3).withOpacity(.5),

        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100,),
                Text("Log In",style: TextStyle(fontSize: 25,color: Color(0xff6574D3),fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),

                TextField(
                  decoration: InputDecoration(
                      hintText: "Password",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)
                      )
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Confirm Password",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11)
                      )
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){}, child: Text("Log In",style: TextStyle(fontSize: 15),)),
                SizedBox(height: 20,),
                InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpPage()));
                    },
                    child: Text("SignUp",style: TextStyle(color: Color(0xff6574D3)))),
                SizedBox(height: 20,),
                Text("Forget Password")

              ],
            ),
          ),
        ),
      ),
    );
  }
}