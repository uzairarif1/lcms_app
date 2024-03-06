import 'package:flutter/material.dart';
import 'package:lcms_app/res/colors.dart';
import 'package:lcms_app/view_model/hearing_vm.dart';
import 'package:provider/provider.dart';

import '../Data/response/status.dart';
import '../Utils/drawer.dart';
import '../view_model/user_viewmodel.dart';
import 'HearingCase_View.dart';
import 'dash_view.dart';

class HearingScreen extends StatefulWidget {
  const HearingScreen({Key? key}) : super(key: key);

  @override
  State<HearingScreen> createState() => _HearingScreenState();
}

class _HearingScreenState extends State<HearingScreen> {

  @override
  void initState() {
    super.initState();
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
    final model = Provider.of<Hearing_VM>(context, listen: false);
    model.fetchListApi(userViewModel);
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Case Hearings",style: TextStyle(fontFamily: 'Roboto_Slab_Bold',fontSize: 24),),
            centerTitle: true,
          ),

          drawer: NavDrawer(),
          body: Column(
              children: [
                Expanded(
                  child: Consumer<Hearing_VM>(
                      builder: (context, value, _) {
                        return
                          value.HearingsList.status == Status.LOADING
                              ? const Center(
                            child: CircularProgressIndicator(),
                          )
                              :
                          ListView.builder(
                            itemCount: value.HearingsList.data!.hearings!.length,
                            itemBuilder: (context,index){
                              final lawyerIndex = index % value.HearingsList.data!.hearings![index].lawyers!.length;
                              return InkWell(
                                onTap:() {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => HearingCase(

                                    date: value.HearingsList.data!.hearings![index].date.toString(),
                                    judge: value.HearingsList.data!.hearings![index].judge.toString(),
                                    judgement: value.HearingsList.data!.hearings![index].judgement.toString(),
                                    case_name: value.HearingsList.data!.hearings![index].caseName.toString(),
                                    lawyer: value.HearingsList.data!.hearings![index].lawyers![lawyerIndex].toString(),
                                    status: value.HearingsList.data!.hearings![index].hearingStatus.toString(),
                                  )));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0,left: 2,right: 2),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.drawerheadColor
                                      ),
                                      child: Card(

                                        child: ListTile(
                                          title: Text(
                                            value.HearingsList.data!.hearings![index].caseName.toString(),
                                              style: TextStyle(fontFamily: 'Roboto_Slab_Bold',fontSize: 20),
                                          ),
                                          subtitle: Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Text(value.HearingsList.data!.hearings![index].date.toString(),
                                                style: TextStyle(fontFamily: 'Roboto_Slab_Regular',fontSize: 16),),
                                          ),
                                          trailing:
                                            Padding(
                                              padding: const EdgeInsets.only(top: 8.0),
                                              child: Text(value.HearingsList.data!.hearings![index].lawyers![lawyerIndex].toString(),
                                                  style: TextStyle(fontFamily: 'Roboto_Slab_Regular',fontSize: 20),),
                                            )
                                        ),
                                      ),
                                    ),
                                  ),

                              );
                            },

                          );

                      }
                  ),
                ),]
          )
      ),
    );
  }
}
