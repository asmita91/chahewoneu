import 'package:flutter/cupertino.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String Des_text;
  const ExpandableTextWidget({Key? key, required this.Des_text})
      : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  //if long text xa vane
  bool hiddenText = true;
  double textHeight = 108; //yesma prblm aauna sakxa

  //check length of the text passed
  @override
  void initState() {
    super.initState();
    if (widget.Des_text.length > textHeight) {
      firstHalf = widget.Des_text.substring(0, textHeight.toInt());
      secondHalf = widget.Des_text.substring(
          textHeight.toInt() + 1, widget.Des_text.length);
    } else {
      firstHalf = widget.Des_text;
      //becoz yo late variable ho ani initialize garnai parxa
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //4.15
    );
  }
}
