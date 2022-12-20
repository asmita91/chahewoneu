import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController newPassword = new TextEditingController();
  TextEditingController Confirmpassword = new TextEditingController();
  bool changePaswordState = false;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      // image: DecorationImage(
      //     image: AssetImage('images/Pokhara.jpg'), fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.grey.withOpacity(0.5),
            body: Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Container(
                  // alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    // color: Colors.grey.withOpacity(0.3),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5,
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05,
                  ),

                ),
              ),
            )));
  }
}