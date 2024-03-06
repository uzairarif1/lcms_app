import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lcms_app/Data/response/status.dart';
import 'package:provider/provider.dart';

import '../Utils/drawer.dart';
import '../res/colors.dart';
import '../view_model/UserProfile_VM.dart';
import '../view_model/cases_vm.dart';
import '../view_model/user_viewmodel.dart';
import 'SingleCase_View.dart';

class CaseView extends StatefulWidget {
  const CaseView({Key? key}) : super(key: key);

  @override
  State<CaseView> createState() => _CaseViewState();
}



class _CaseViewState extends State<CaseView> {

  @override
  void initState() {
    super.initState();
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
    final model = Provider.of<Cases_VM>(context, listen: false);
    model.fetchListApi(userViewModel);
  }

  @override
  Widget build(BuildContext context) {

    final height  = MediaQuery.of(context).size.height * 1 ;
    final width  = MediaQuery.of(context).size.width * 1 ;
    return
      SafeArea(
        child: Scaffold(
        appBar: AppBar(
          title: const Text("My Cases",style: TextStyle(fontFamily: 'Roboto_Slab_Bold',fontSize: 24),),
          centerTitle: true,
        ),

          drawer: NavDrawer(),
          body: Column(
            children: [
              Expanded(
                child: Consumer<Cases_VM>(
                  builder: (context, value, _) {
                    return
                      value.CasesList.status == Status.LOADING
                        ? const Center(
                      child: CircularProgressIndicator(),
                    )
                        :
                    ListView.builder(
                        itemCount: value.CasesList.data!.cases!.length,
                        itemBuilder: (context,index){
                          final lawyerIndex = index % value.CasesList.data!.cases![index].lawyers!.length;

                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SingleCaseScreen(
                                no: value.CasesList.data!.cases![index].details!.caseNo.toString(),
                                title: value.CasesList.data!.cases![index].details!.title.toString(),
                                description: value.CasesList.data!.cases![index].details!.description.toString(),
                                type: value.CasesList.data!.cases![index].details!.type.toString(),
                                date: value.CasesList.data!.cases![index].details!.startDate.toString(),
                                lawyer: value.CasesList.data!.cases![index].lawyers![lawyerIndex].toString(),
                                status: value.CasesList.data!.cases![index].details!.status.toString(),
                              )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(

                                height: height * .25,
                                width: width * .6,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image(
                                            fit: BoxFit.cover,
                                            height: height * .2,
                                            width: width * 1,
                                            image: AssetImage('assets/hammer.jpg'),
                                          ),
                                        ),
                                        Positioned.fill(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 5,
                                          left: 10,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFFFCFF),
                                                borderRadius: BorderRadius.circular(20.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                                child: Text(
                                                  value.CasesList.data!.cases![index].details!.title.toString(),
                                                  style: TextStyle(
                                                    fontFamily: 'Roboto_Slab_Bold',
                                                    fontSize: 16,
                                                  ),
                                                ),

                                              ),

                                            ),

                                          ),

                                        ),

                                      ],
                                    ),


                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(value.CasesList.data!.cases![index].details!.startDate.toString() , style: TextStyle(color: Color(0xff323232) , fontSize: 14,fontFamily: 'Roboto_Slab_Regular'),),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          );
                          });

                        }
                        ),
              ),]
    )
        ),
      );
  }
}


