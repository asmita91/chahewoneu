



import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../ViewModel/auth_viewmodel.dart';


class ProfileInfo extends StatefulWidget {
  ProfileInfo({Key? key}) : super(key: key);

  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  late AuthViewModel _authViewModel;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    });
    super.initState();
  }

  File? _image;
  Future<void> getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return;
    }
    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }

  Widget UserName(AuthViewModel authVM) {
    return Text(
      authVM.loggedInUser != null
          ? authVM.loggedInUser!.fullName.toString()
          : "Guest",
      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
    );
  }

  Widget userEmail(AuthViewModel authVM) {
    return Text(
      authVM.loggedInUser != null
          ? authVM.loggedInUser!.email.toString()
          : "Guest",
      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
    );
  }

  Widget userPhone(AuthViewModel authVM) {
    return Text(
      authVM.loggedInUser != null
          ? authVM.loggedInUser!.phone.toString()
          : "Guest",
      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
    );
  }

  Widget userUsername(AuthViewModel authVM) {
    return Text(
      authVM.loggedInUser != null
          ? authVM.loggedInUser!.username.toString()
          : "Guest",
      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
    );
  }

  Widget userPassword(AuthViewModel authVM) {
    return Text(
      authVM.loggedInUser != null
          ? authVM.loggedInUser!.password.toString()
          : "Guest",
      style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (context, authVM, chid) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            centerTitle: true,
            title: Text("Profile Information"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: _image != null
                              ? Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          )
                              : Image.network(
                            "https://imgs.search.brave.com/VfOlmssamn3NTAP14DFpqr1z9pxdR7P4czo10TKxRuk/rs:fit:860:681:1/g:ce/aHR0cHM6Ly93d3cu/cG5naXRlbS5jb20v/cGltZ3MvbS8xNDYt/MTQ2ODQ3OV9teS1w/cm9maWxlLWljb24t/YmxhbmstcHJvZmls/ZS1waWN0dXJlLWNp/cmNsZS1oZC5wbmc",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 125,
                        left: 100,
                        width: 90,
                        height: 30,
                        child: ActionChip(
                          label: Text("Change"),
                          onPressed: () => getImage(ImageSource.gallery),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Card(
                  elevation: 3,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.person_outline),
                        title: Text("Full name"),
                        subtitle: UserName(authVM),
                      ),
                      ListTile(
                        leading: Icon(Icons.email_outlined),
                        title: Text("Email"),
                        subtitle: userEmail(authVM),
                      ),
                      ListTile(
                        leading: Icon(Icons.lock_open),
                        title: Text("Password"),
                        subtitle: userPassword(authVM),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone_android),
                        title: Text("Phone"),
                        subtitle: userPhone(authVM),
                      ),
                      ListTile(
                        leading: Icon(Icons.portrait),
                        title: Text("Username"),
                        subtitle: userUsername(authVM),
                      )
                    ],
                  ),
                ),
              )
            ],
          ));
    });
  }
}




















// import 'package:chahewoneu/UserScreens/UserLogin.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:provider/provider.dart';
//
// import '../../ViewModel/GlobalUIViewModel.dart';
// import '../../ViewModel/auth_viewmodel.dart';
//
//
//
//
// class UserProfile extends StatefulWidget {
//   const UserProfile({super.key});
//
//   @override
//   State<UserProfile> createState() => _UserProfileState();
// }
//
// class _UserProfileState extends State<UserProfile> {
//   void logout() async {
//     _ui.loadState(true);
//     try {
//       await _auth.logout().then((value) {
//         Navigator.of(context).pushReplacementNamed('/login');
//       }).catchError((e) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text(e.message.toString()),
//           backgroundColor: Colors.purpleAccent,
//           behavior: SnackBarBehavior.floating,
//           margin: EdgeInsets.all(50),
//           elevation: 20,
//         ));
//       });
//     } catch (err) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text(err.toString()),
//         backgroundColor: Colors.purpleAccent,
//         behavior: SnackBarBehavior.floating,
//         margin: EdgeInsets.all(50),
//         elevation: 20,
//       ));
//     }
//     _ui.loadState(false);
//   }
//
//   late GlobalUIViewModel _ui;
//   late AuthViewModel _auth;
//   @override
//   void initState() {
//     _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
//     _auth = Provider.of<AuthViewModel>(context, listen: false);
//     super.initState();
//   }
//
//   double rating = 0;
//   createRating() {
//     return SizedBox(
//       child: RatingBar.builder(
//         initialRating: rating,
//         minRating: 1,
//         itemSize: 35,
//         itemPadding: EdgeInsets.symmetric(horizontal: 1),
//         itemBuilder: (context, _) => Icon(
//           CupertinoIcons.heart_fill,
//           color: Colors.redAccent,
//         ),
//         updateOnDrag: true,
//         onRatingUpdate: (rating) => setState(() {
//           this.rating = rating;
//         }),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Your Profile"),
//         backgroundColor: Colors.purple,
//         actions: [
//           IconButton(
//               icon: const Icon(Icons.sell),
//               tooltip: 'Open shopping cart',
//               onPressed: () {
//                 Navigator.of(context).pushNamed("/my-products");
//               })
//         ],
//       ),
//       body: Container(
//         color: Color(0xFFD6D6D6),
//         child: ListView(
//           children: [colorTiles(), bwTiles(), logoutButton()],
//         ),
//       ),
//     );
//   }
//
//   Widget divider() {
//     return Padding(
//       padding: const EdgeInsets.all(0.5),
//       child: Divider(
//         thickness: 1.5,
//       ),
//     );
//   }
//
//   Widget colorTiles() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           children: [
//             ListTile(
//               leading: Container(
//                 child: Icon(Icons.person_outline, color: Colors.deepPurple),
//                 height: 30,
//                 width: 30,
//                 decoration: BoxDecoration(
//                   color: Colors.deepPurple.withOpacity(0.09),
//                   borderRadius: BorderRadius.circular(18),
//                 ),
//               ),
//               title: Text("Personal Data",
//                   style: TextStyle(fontWeight: FontWeight.w700)),
//               trailing:
//               Icon(Icons.arrow_forward_ios, color: Colors.purple, size: 20),
//               onTap: () {
//                 Navigator.of(context).pushNamed("/your_profile");
//               },
//             ),
//             divider(),
//             ListTile(
//               leading: Container(
//                 child: Icon(Icons.email_outlined, color: Colors.blue),
//                 height: 30,
//                 width: 30,
//                 decoration: BoxDecoration(
//                   color: Colors.blue.withOpacity(0.09),
//                   borderRadius: BorderRadius.circular(18),
//                 ),
//               ),
//               title: Text("Change your email",
//                   style: TextStyle(fontWeight: FontWeight.w700)),
//               trailing:
//               Icon(Icons.arrow_forward_ios, color: Colors.purple, size: 20),
//               onTap: () {
//                 Navigator.of(context).pushNamed("/change_email");
//               },
//             ),
//             divider(),
//             ListTile(
//               leading: Container(
//                 child: Icon(Icons.password_outlined, color: Colors.pink),
//                 height: 30,
//                 width: 30,
//                 decoration: BoxDecoration(
//                   color: Colors.pink.withOpacity(0.09),
//                   borderRadius: BorderRadius.circular(18),
//                 ),
//               ),
//               title: Text("Change your password",
//                   style: TextStyle(fontWeight: FontWeight.w700)),
//               trailing:
//               Icon(Icons.arrow_forward_ios, color: Colors.purple, size: 20),
//               onTap: () {
//                 Navigator.of(context).pushNamed("/change_password");
//               },
//             ),
//             divider(),
//             ListTile(
//               leading: Container(
//                 child: Icon(Icons.location_city, color: Colors.orange),
//                 height: 30,
//                 width: 30,
//                 decoration: BoxDecoration(
//                   color: Colors.orange.withOpacity(0.09),
//                   borderRadius: BorderRadius.circular(18),
//                 ),
//               ),
//               title: Text("Change your address",
//                   style: TextStyle(fontWeight: FontWeight.w700)),
//               trailing:
//               Icon(Icons.arrow_forward_ios, color: Colors.purple, size: 20),
//               onTap: () {
//                 Navigator.of(context).pushNamed("/change_address");
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   bool _notificationEnabled = false;
//   Widget bwTiles() {
//     Color color = Colors.black;
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           children: [
//             ListTile(
//               leading: Container(
//                 child: Icon(Icons.history, color: color),
//                 height: 30,
//                 width: 30,
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.09),
//                   borderRadius: BorderRadius.circular(18),
//                 ),
//               ),
//               title: Text("Order History",
//                   style: TextStyle(fontWeight: FontWeight.w700)),
//               trailing:
//               Icon(Icons.arrow_forward_ios, color: Colors.purple, size: 20),
//               onTap: () {},
//             ),
//             divider(),
//             ListTile(
//               leading: Container(
//                 child: Icon(Icons.notification_add, color: color),
//                 height: 30,
//                 width: 30,
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.09),
//                   borderRadius: BorderRadius.circular(18),
//                 ),
//               ),
//               title: Text("Notification",
//                   style: TextStyle(fontWeight: FontWeight.w700)),
//               trailing: Switch(
//                 value: _notificationEnabled,
//                 activeColor: Colors.purple,
//                 inactiveTrackColor: Colors
//                     .grey, // _notificationEnabled is a boolean variable that indicates the current state of the toggle switch
//                 onChanged: (bool value) {
//                   setState(() {
//                     _notificationEnabled = value;
//                   });
//                 },
//               ),
//             ),
//             divider(),
//             ListTile(
//               leading: Container(
//                 child: Icon(Icons.info_outline, color: color),
//                 height: 30,
//                 width: 30,
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.09),
//                   borderRadius: BorderRadius.circular(18),
//                 ),
//               ),
//               title:
//               Text("FAQ's", style: TextStyle(fontWeight: FontWeight.w700)),
//               trailing:
//               Icon(Icons.arrow_forward_ios, color: Colors.purple, size: 20),
//               onTap: () {
//                 Navigator.of(context).pushNamed("/faqs");
//               },
//             ),
//             divider(),
//             ListTile(
//               leading: Container(
//                 child: Icon(Icons.rate_review, color: color),
//                 height: 30,
//                 width: 30,
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.09),
//                   borderRadius: BorderRadius.circular(18),
//                 ),
//               ),
//               title: Text("Rate Our App",
//                   style: TextStyle(fontWeight: FontWeight.w700)),
//               trailing:
//               Icon(Icons.arrow_forward_ios, color: Colors.purple, size: 20),
//               onTap: () {
//                 Navigator.push(context, showPopUpRatingDialog(context));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   showPopUpRatingDialog(BuildContext context) => showCupertinoDialog(
//       context: context,
//       builder: (context) => CupertinoAlertDialog(
//         title: Text("Your opinion matters to us!"),
//         content: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
//               // padding: EdgeInsets.symmetric(horizontal: 0),
//               child: Align(
//                 alignment: Alignment.topCenter,
//                 child: Text(
//                     "If you enjoy using our app, would you mind rating?",
//                     style: TextStyle(fontSize: 18),
//                     textAlign: TextAlign.center),
//               ),
//             ),
//             createRating(),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               // Navigator.push(context);
//             },
//             child: Text(
//               "Cancel",
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//           TextButton(
//             onPressed: () {
//               if (rating == 0) {
//                 Navigator.pop(context);
//               } else {
//                 Navigator.pop(context);
//                 Navigator.push(context, showPopUpThankYouDialog(context));
//                 setState(() {
//                   rating = 0;
//                 });
//               }
//             },
//             child: Text(
//               "OK",
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//         ],
//       ));
//
//   showPopUpThankYouDialog(BuildContext context) => showCupertinoDialog(
//       context: context,
//       builder: (context) => CupertinoAlertDialog(
//         title: Text("Thank You!"),
//         content: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               // height: 100,
//               // width: 50,
//               padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
//               // padding: EdgeInsets.symmetric(horizontal: 0),
//               child: Align(
//                 alignment: Alignment.topCenter,
//                 child: Text("For rating our app",
//                     style: TextStyle(fontSize: 18),
//                     textAlign: TextAlign.center),
//               ),
//             ),
//             Positioned(
//                 top: -100,
//                 child: Image.asset('assets/images/thankyou.png',
//                     width: 150, height: 150))
//             // createRating(),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text(
//               "OK",
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//         ],
//       ));
//
//   Widget logoutButton() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//       child: SizedBox(
//         width: double.infinity,
//         height: 60,
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//             Navigator.of(context).push(MaterialPageRoute(
//                 builder: (BuildContext context) => UserLoginPage()));
//
//             logout();
//             // Add your code for logging out here
//           },
//           style: ElevatedButton.styleFrom(
//             primary: Colors.purple,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(28),
//             ),
//           ),
//           child: const Text(
//             "Log out",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 22,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }









// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
//
// import '../../Navpages/Widgets/profile_menu.dart';
// import '../../imagestrings.dart';
// import '../../textstrings.dart';
//
// class UserProfilePage extends StatelessWidget {
//   const UserProfilePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     //for dark theme
//     var isDark=MediaQuery.of(context).platformBrightness==Brightness.dark;
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         leading: IconButton(onPressed: (){
//           Navigator.pop(context);
//         }, icon: Icon(LineAwesomeIcons.angle_left),color: Colors.black,),
//         title: Text(tProfile, style: Theme.of(context).textTheme.headline4,),
//         actions: [
//           IconButton(onPressed: (){}, icon: Icon(isDark? LineAwesomeIcons.sun:LineAwesomeIcons.moon),color: Colors.black,),
//         ],
//
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.only(top: 33,right: 23),
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   SizedBox(
//                     width: 120,
//                     height: 120,
//                     child: ClipRRect(
//                         borderRadius: BorderRadius.circular(110),
//                         child: Image(image: AssetImage(tProfileImage))),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: Container(
//                       width: 35,
//                       height: 35,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(100),
//                         color: Colors.deepPurple,
//                       ),
//                       child: const Icon(LineAwesomeIcons.alternate_pencil,
//                         color:Colors.white ,size: 20,),
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Text(tProfileHeading, style: TextStyle(
//                 fontSize: 19,
//                 fontWeight: FontWeight.w400,
//
//               )),
//               Text(tProfileSubHeading, style: TextStyle(
//                 fontSize: 13,
//               )),
//               const SizedBox(height: 20),
//               SizedBox(
//                 width: 200,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: (){
//                     Navigator.pushNamed(context, "/updateprofile");
//                   },
//                   child: const Text(tEditProfile,style: TextStyle(
//                     color: Colors.white,
//                   )),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.deepPurple,
//                     shape: const StadiumBorder(),side: BorderSide.none,
//                   ),
//
//                 ),
//               ),
//               const SizedBox(height: 30),
//               const Divider(),
//               const SizedBox(height: 10),
//
//
//
//               ProfileMenuWidget(title: "User Details",
//                 icon: LineAwesomeIcons.user_check,onPress: (){
//                   Navigator.pushNamed(context, "/CustomerDetails");
//                 },),
//               ProfileMenuWidget(title: "Payment Details",
//                 icon: LineAwesomeIcons.money_bill,onPress: (){},),
//               ProfileMenuWidget(title: "Logout",
//                 textColor: Colors.red,
//                 icon: LineAwesomeIcons.alternate_sign_out,
//                 endIcon: false,
//                 onPress: (){},),
//
//
//
//
//
//
//
//
//             ],
//           ),
//
//
//         ),
//       ),
//     );
//   }
// }
//
