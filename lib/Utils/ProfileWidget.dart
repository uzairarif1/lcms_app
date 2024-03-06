

import 'package:flutter/material.dart';

class ReuseableWidget extends StatelessWidget {
  String title, value;
  ReuseableWidget({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title,style: TextStyle(fontFamily: 'Roboto_Slab_Regular',fontSize: 17),), Text(value,style: TextStyle(fontFamily: 'Roboto_Slab_Regular',fontSize: 17),)],
          ),
          SizedBox(height: 5),
          Divider()
        ],
      ),
    );
  }
}
