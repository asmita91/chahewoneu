import 'package:flutter/material.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool changePaswordState = false;
  final _formkey = GlobalKey<FormState>();
  showHidePassword() {
    setState(() {
      changePaswordState = !changePaswordState;
    });
  }

  Widget showVisibilityIcon(bool showPassword) {
    return showPassword == changePaswordState
        ? InkWell(
        onTap: () {
          setState(() {
            changePaswordState = !changePaswordState;
          });
        },
        child: Icon(Icons.hide_source_outlined))
        : InkWell(
        onTap: () {
          setState(() {
            changePaswordState = !changePaswordState;
          });
        },
        child: Icon(Icons.remove_red_eye));
  }

  hintStyle() {
    TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  outlineForInputField() {
    OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.white),
        borderRadius: BorderRadius.circular(20));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(

              image: AssetImage('images/regepage.jpg'), fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.6,
                    right: 25,
                    left: 25,
                    bottom: MediaQuery.of(context).size.height * 0.2,
                  ),
                  height: MediaQuery.of(context).size.height * 0.4,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20)),
                  child: Form(
                    key: _formkey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              label: Text("username"),
                              hintText: "Please enter your username",
                              prefixIcon: Icon(Icons.man),

                            ),

                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.white70),
                            controller: email,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Email is required";
                              }
                              if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return "Please enter valid email";                               }
                              return null;                             },
                            decoration: InputDecoration(
                                enabledBorder: outlineForInputField(),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                hintText: "Email",
                                hintStyle: hintStyle()),
                          ),
                          SizedBox(
                            height: 10,                           ),
                          TextFormField(
                            style: TextStyle(color: Colors.white70),
                            controller: password,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "password is required";                               }
                              if (value.length < 5 || value.length > 10) {
                                return "enter password of 5 to 10 characters";                               }
                              return null; // null return garyo vane chai pass vako ho
                            },
                            obscureText: !changePaswordState,
                            decoration: InputDecoration(
                                enabledBorder: outlineForInputField(),
                                prefixIcon:
                                Icon(Icons.password, color: Colors.black),
                                hintText: "Password",
                                hintStyle: hintStyle(),
                                suffixIcon:
                                showVisibilityIcon(changePaswordState)),
                            // validator: Validators(),
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.white70),
                            controller: password,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "password is required";                               }
                              if (value.length < 5 || value.length > 10) {
                                return "enter password of 5 to 10 characters";                               }
                              return null; // null return garyo vane chai pass vako ho
                            },
                            obscureText: !changePaswordState,
                            decoration: InputDecoration(
                                enabledBorder: outlineForInputField(),
                                prefixIcon:
                                Icon(Icons.password, color: Colors.black),
                                hintText: "Confirm Password",
                                hintStyle: hintStyle(),
                                suffixIcon:
                                showVisibilityIcon(changePaswordState)),
                            // validator: Validators(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.lightGreen),
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("Login validation successful"),
                                ));
                                Navigator.of(context).pushNamed("/dashboard");
                              } else {
                                print("Invalid form");                               }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,                           ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white70),
                                ),
                              ],

                            ),
                          ),
                        ]),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}