
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class NotificationService{
  static final FlutterLocalNotificationsPlugin
  _notificationsPlugin = FlutterLocalNotificationsPlugin();

  static void initialize() {
    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"),
        iOS: DarwinInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false
        )
    );
  }
  _notificationsPlugin.initialize(initializationSettings,
  onDidReceiveNotificationResponse: onDidReceiveNotificationResponse
  );
    }
static BuildContext? context;
static void onDidReceiveNotificationResponse
(NotificationResponse? response) {
if (response != null && response.payload != null) {
Navigator.of(context!).pushNamed(response.payload.toString());
print(response.payload);
}
}
static Future<String> getImageFilePathFromAssets(
String asset, String filename) async {
final byteData = await rootBundle.load(asset);
final temp_direactory = await getTemporaryDirectory();
final file = File('${temp_direactory.path}/$filename');
await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

return file.path;
}
static void display(String title,String body,String payload,BuildContext _context) async{
context=_context;
// if image from asset
//big picture title ko tala
final bigpicture = await getImageFilePathFromAssets(
'assets/images/logoicon.png', 'bigpicture');

//title ko side ma aaune simple image
final smallpicture = await getImageFilePathFromAssets(
'assets/images/logoicon.png', 'smallpicture');

//scroll garesi aaune image
final styleinformationDesign = BigPictureStyleInformation(
  FilePathAndroidBitmap(smallpicture),
  largeIcon: FilePathAndroidBitmap(bigpicture),
);
final id=DateTime.now().millisecondsSinceEpoch ~/1000;
final NotificationDetails notificationDetails=

NotificationDetails(

    android :AndroidNotificationDetails(
      //yo app ko anusra change garna parcha
      //myapp channel andriod ma huncha so dinaiparne huncha
        "myapp",
        "myapp channel",
        channelDescription:"Channel Description",
        //importance and priority chai high and max rakhe vane notification background ma aaune ki pop up hune
        importance : Importance.max,
        priority:Priority.high,
        styleInformation: styleinformationDesign
    ),


    iOS:DarwinNotificationDetails()
);
