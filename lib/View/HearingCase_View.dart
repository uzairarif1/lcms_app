import 'package:flutter/material.dart';

import '../Utils/ProfileWidget.dart';

class HearingCase extends StatefulWidget {
  String date, case_name,judgement,status,lawyer,judge;
   HearingCase({Key? key,required this.judge,required this.case_name,required this.judgement,required this.lawyer,required this.status,required this.date}) : super(key: key);

  @override
  State<HearingCase> createState() => _HearingCaseState();
}

class _HearingCaseState extends State<HearingCase> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Hearing Details',style: TextStyle(fontFamily: 'Roboto_Slab_Bold',fontSize: 24),),
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
                          ReuseableWidget(title: 'Case', value: widget.case_name.toString()),
                          ReuseableWidget(title: 'Lawyer', value: widget.lawyer.toString()),
                          ReuseableWidget(title: 'Hearing Date', value: widget.date.toString()),
                          ReuseableWidget(title: 'Status', value: widget.status.toString()),
                          ReuseableWidget(title: 'Judgement', value: widget.judgement.toString()),
                          ReuseableWidget(title: 'Judge', value: widget.judge.toString()),
                        ],
                      )
                  )
              )
          )
      ),
    );
  }
}

