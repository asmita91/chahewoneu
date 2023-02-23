

import 'package:chahewoneu/imagestrings.dart';
import 'package:flutter/material.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../textstrings.dart';
import 'Widgets/profile_menu.dart';

class AdminProfilePage extends StatelessWidget {
  const AdminProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //for dark theme
    var isDark=MediaQuery.of(context).platformBrightness==Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(LineAwesomeIcons.angle_left),color: Colors.black,),
        title: Text(tProfile, style: Theme.of(context).textTheme.headline4,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(isDark? LineAwesomeIcons.sun:LineAwesomeIcons.moon),color: Colors.black,),
        ],

      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 33,right: 23),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(110),
                        child: Image(image: AssetImage(tProfileImage))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.deepPurple,
                      ),
                      child: const Icon(LineAwesomeIcons.alternate_pencil,
                        color:Colors.white ,size: 20,),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(tProfileHeading, style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w400,

              )),
              Text(tProfileSubHeading, style: TextStyle(
                fontSize: 13,
              )),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, "/updateprofile");
                  },
                  child: const Text(tEditProfile,style: TextStyle(
                    color: Colors.white,
                  )),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: const StadiumBorder(),side: BorderSide.none,
                  ),

                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),



              ProfileMenuWidget(title: "User Details",
                icon: LineAwesomeIcons.user_check,onPress: (){
                Navigator.pushNamed(context, "/customer");
                },),
              ProfileMenuWidget(title: "Payment Details",
                icon: LineAwesomeIcons.money_bill,onPress: (){
                // Navigator.pushNamed(context, )
                },),
              ProfileMenuWidget(title: "Logout",
                textColor: Colors.red,
                icon: LineAwesomeIcons.alternate_sign_out,
                endIcon: false,
                onPress: (){},),








            ],
          ),


        ),
      ),
    );
  }
}

