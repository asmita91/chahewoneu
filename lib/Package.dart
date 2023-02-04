import 'package:chahewoneu/models/People_Model.dart';
import 'package:chahewoneu/viewmodels/People_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'UserScreens/navpages/app_icon.dart';

class Package extends StatefulWidget {
  const Package({Key? key}) : super(key: key);

  @override
  State<Package> createState() => _PackageState();
}

class _PackageState extends State<Package> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  late PeopleViewModel _peopleViewModel;

  @override
  void initState() {
    _peopleViewModel = Provider.of<PeopleViewModel>(context, listen: false);
    _peopleViewModel.getPeople();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var people = context.watch<PeopleViewModel>().people;

    return Scaffold(
        appBar: AppBar(
            title: Row(
          children: [
            AppIcon(icon: Icons.arrow_back),
            SizedBox(
              width: 5,
            ),
            Text("Package",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ],
        )),
        body: StreamBuilder(
            stream: people,
            builder:
                (context, AsyncSnapshot<QuerySnapshot<PeopleModel>> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error");
              } else {
                return ListView(children: [
                  ...snapshot.data!.docs.map((document) {
                    PeopleModel people = document.data();
                    return ListTile(
                      leading: Container(
                        width: MediaQuery.of(context).size.height / 20,
                        height: MediaQuery.of(context).size.height / 20,
                        child: CircleAvatar(
                          backgroundImage: AssetImage("Images/hiace.png"),
                        ),
                      ),
                      title: Text(people.userName,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "No of people booked: ${people.number}",
                          ),
                          Text("Add other contents here"),
                          Text("Add other contents here"),
                          Text("Add other contents here"),
                        ],
                      ),
                    );
                  })
                ]);
              }
            }));
  }
}
