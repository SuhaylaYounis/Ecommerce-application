import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProfileMenuScreen extends StatelessWidget {
  const ProfileMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(100),
                  ),
                  image:DecorationImage(
                    image: AssetImage('assets/images/img.png'),
                    fit: BoxFit.fill,
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
