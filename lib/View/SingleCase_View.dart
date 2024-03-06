import 'package:flutter/material.dart';

import '../Utils/ProfileWidget.dart';

class SingleCaseScreen extends StatefulWidget {
  String no, title,description,date,type,status,lawyer;

   SingleCaseScreen({Key? key,required this.title,required this.no,required this.description,required this.lawyer,required this.type,required this.status,required this.date}) : super(key: key);

  @override
  State<SingleCaseScreen> createState() => _SingleCaseScreenState();
}

class _SingleCaseScreenState extends State<SingleCaseScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Case Details',style: TextStyle(fontFamily: 'Roboto_Slab_Bold',fontSize: 24),),
            centerTitle: true,

          ),
          body: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: Card(
                    child: Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                        ReuseableWidget(title: 'Case No', value: widget.no.toString()),
                        ReuseableWidget(title: 'Title', value: widget.title.toString()),
                        ReuseableWidget(title: 'Start Date', value: widget.date.toString()),
                        ReuseableWidget(title: 'Type', value: widget.type.toString()),
                        ReuseableWidget(title: 'Lawyer', value: widget.lawyer.toString()),
                        ReuseableWidget(title: 'Status', value: widget.status.toString()),
      ],
      )
      )
      )
          )
      ),
    );
  }
}
