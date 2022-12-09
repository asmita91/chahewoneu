import 'package:flutter/material.dart';
import '../Colors.dart' as color;

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.AdminDashboardPage,
      body: Container(
        // padding: const EdgeInsets.only(top: 30, left:105,),
        child:Column(

          children: [
            Row(
              children: [

                Text(
                  "Chahewoneu",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: color.AppColor.DashboardTitle
                  ),
                ),
              ],

            ),

            SizedBox(height:30,),

            Container(
              padding: const EdgeInsets.only(right: 0,),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Events and Activities",
                    style: TextStyle(
                      fontSize: 30,
                      color:color.AppColor.Events,
                      fontWeight: FontWeight.w700,
                    ),


                  )
                ],
              ),
            ),
            Container(

              // child: Container(
              padding: const EdgeInsets.only(left: 0),
              margin: EdgeInsets.only(left: 10,right: 200),
              width: MediaQuery.of(context).size.width,
              height: 170,
              decoration: BoxDecoration(
                  color: Colors.white,
                  // image: DecorationImage(
                  //   image: AssetImage(
                  //     "assets/paraa.avif"
                  //   )
                  // ),
                  borderRadius: BorderRadius.only(

                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  boxShadow:[
                    BoxShadow(
                      offset: Offset(5,10),
                      blurRadius: 20,
                      color: color.AppColor.Shadow.withOpacity(0.2),

                    ),
                  ]

              ),
              child: Column(
                children: [
                  Text(
                    "Paragliding",
                    style: TextStyle(
                      fontSize: 20,
                      color: color.AppColor.para,

                    ),
                  )
                ],
              ),


            )

            // )
          ],


        ),
      ),
    );
  }
}
