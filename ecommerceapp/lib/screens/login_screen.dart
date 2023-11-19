import 'package:ecommerceapp/constants/constants.dart';
import 'package:ecommerceapp/custom_text_form_field/custom_text_form_field_email.dart';
import 'package:ecommerceapp/custom_text_form_field/custom_text_form_field_pass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatelessWidget {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height,
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      kPrimaryColor,
                      Colors.green,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 36.0, horizontal: 24.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 46.0,
                                        fontWeight: FontWeight.w700,
                                      )),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text("Shop your stress away",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.60,
                                        fontWeight: FontWeight.w300,
                                      )),
                                ]))),
                    Expanded(
                      flex: 5,
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                        ),
                        child: Form(
                          //TO link the two text fields (whe there is error etc..)
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.only(top:100.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //SizedBox(height: MediaQuery.of(context).size.height / 12),
                                CustomTextFormFieldEmail(

                                  validator: (value) {
                                    if (!(value.contains('@')) ||
                                        !(value.contains('.com')) ||
                                        value.isEmpty) {
                                      return "please enter correct email";
                                    } else {
                                      return null;
                                    }
                                  },
                                  keyboardtype: TextInputType.emailAddress,
                                  onSaved: (value) {
                                    email = value;
                                  },
                                  hint: 'Email',
                                ),
                                SizedBox(height: 30,),
                                CustomTextFormFieldPass(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "please enter Email";
                                    } else {
                                      if (value.length < 3) {
                                        return "must be more than 2 characters";
                                      } else {
                                        return null;
                                      }
                                    }
                                  },
                                  onSaved: (value) {
                                    password = value;
                                  },
                                  hintText: 'Password',
                                  // obscureText: true,
                                  keyboardType: TextInputType.visiblePassword,
                                ),
                                SizedBox(height: 60,),
                                MaterialButton(onPressed: (){
                                  _formKey.currentState!.save();
                                  if(_formKey.currentState!.validate()){
                                    LoginApi(email!,password!).then((value){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(value),));
                                    });
                                  }
                                },
                                    height: 40,
                                    minWidth: 140,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                    color: kPrimaryColor,
                                    child: Text("login", style:TextStyle(color:Colors.white, fontSize: 19), ) ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ))
    );

  }
  Future<String> LoginApi(String email,String password) async {
    var url = Uri.parse("https://student.valuxapps.com/api/login");
    var response = await http.post(url,
        headers: {
          "lang":"ar",
        },
        body: {
          "email":email,
          "password":password,
        }
    );
    print("${response.body}");
    print("${response.statusCode}");
    var responsebody=jsonDecode(response.body)["message"];
    print("${responsebody}");
    return responsebody;

  }
}