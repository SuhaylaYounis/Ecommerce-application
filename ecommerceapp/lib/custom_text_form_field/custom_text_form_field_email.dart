import 'package:ecommerceapp/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class CustomTextFormFieldEmail extends StatelessWidget {
  var validator;
  var keyboardtype;
  var onSaved;
  String? hint;
  CustomTextFormFieldEmail({
    required this.validator,
    required this.keyboardtype,
    required this.onSaved,
    this.hint
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right:15),
        child: TextFormField(
          validator: validator,
          keyboardType: keyboardtype,
          onSaved: onSaved,
          decoration: InputDecoration(
            fillColor: grey,
            filled: true,
            hintText: hint,
            prefixIcon: Icon(
                Icons.email,
                color:Colors.grey[800]
            ),
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.all(20.0),
            //when you open the app to the login screen and click on the text field
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
            //when there is no action on the textfield
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
            //when you finished writing in the text field and start in the next one
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
      ),
    );
  }
}
