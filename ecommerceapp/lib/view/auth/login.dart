import 'package:ecommerceapp/view/widgets/custom_text.dart';
import 'package:ecommerceapp/view/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constance.dart';
class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:50,right:20.0,left: 20.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: "Welcome,", fontSize: 30,color: Colors.black,),
                CustomText(text: "Sign up", fontSize: 18,color: primcolor,),
                SizedBox(height: 10,),
                CustomText(text: "Sign in to Continue", fontSize: 14,color: Colors.grey ,),
                SizedBox(height: 30,),
                CustomTextFormField(
                  text: "Email",
                  hint: "iamdavid@gmail.com",
                  validator: (value){},
                  onSave: (value){},
                ),
                SizedBox(height: 40,),
                CustomTextFormField(
                  text: "Password",
                  hint: "********",
                  validator: (value){},
                  onSave: (value){},
                ),
                SizedBox(height: 20,),
                CustomText(
                  text: "Forgot Password?",
                  color: Colors.black,
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                MaterialButton(onPressed: (){
                },
                    height: 40,
                    minWidth: 200,
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    color: kgreen,
                    child: Text("SIGN IN", style:TextStyle(color:Colors.white, fontSize: 19), ) ),


            ],
              )
          ],
        ),
      ),
    );
  }
}
