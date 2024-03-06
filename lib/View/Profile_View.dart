import 'package:flutter/material.dart';
import 'package:lcms_app/Data/response/status.dart';
import 'package:lcms_app/res/colors.dart';
import 'package:lcms_app/view_model/UserProfile_VM.dart';
import 'package:provider/provider.dart';

import '../Data/response/api_response.dart';
import '../Utils/ProfileWidget.dart';
import '../Utils/drawer.dart';
import '../model/Auth_model.dart';
import '../view_model/user_viewmodel.dart';



class ProfileScreen extends StatefulWidget {
  //final UserViewModel userViewModel;

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
    final model = Provider.of<Profile_vm>(context, listen: false);
    model.fetchProfileListApi(userViewModel);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile",style: TextStyle(fontFamily: 'Roboto_Slab_Bold',fontSize: 24),),
        centerTitle: true,
      ),
      drawer: NavDrawer(),
      body: Column(
        children: [
          Expanded(
            child: Consumer<Profile_vm>(
              builder: (context, value, _) {
                return value.Profile.status == Status.LOADING
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                //Text(value.Profile.data!.pageName.toString());
                //     : ListView.builder(
                //     itemBuilder: (context, index) {
                    :
                    ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context,index){
                      return
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,

                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: Stack(
                                      alignment: Alignment.topCenter,

                                      children: [
                                        Card(
                                            child:
                                            Padding(
                                              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .1),
                                              child: Column(
                                                children: [

                                                  SizedBox(height: MediaQuery.of(context).size.height * .06,),
                                                  ReuseableWidget(
                                                      title: 'Name', value: '${value.Profile.data!.client!.firstname.toString()}'
                                                      ' ${value.Profile.data!.client!.lastname.toString() }'),
                                                  ReuseableWidget(
                                                      title: 'Email', value: value.Profile.data!.client!.email.toString()),
                                                  ReuseableWidget(
                                                      title: 'Phone', value:value.Profile.data!.client!.phone.toString()),
                                                  ReuseableWidget(
                                                      title: 'Address', value:value.Profile.data!.client!.address.toString()),
                                                 // ReuseableWidget(title: 'Today Recovered', value:value.Profile.data!.client!.address.toString()),
                                                  ReuseableWidget(
                                                      title: 'Gov ID', value: value.Profile.data!.client!.govId.toString()),

                                                ],

                                              ),
                                            )


                                        ),
                                        const Positioned(child: CircleAvatar(
                                          radius: 50,
                                          backgroundImage: AssetImage('assets/cli.png'),
                                          //foregroundColor: AppColors.drawerheadColor,
                                          backgroundColor: AppColors.avatarColor,

                                        ),),

                                      ],

                                    ),
                                  ),
                                ]),
                            ),
                          ),
                        );


                        });





              },
                )

          )],
      ),
    );
  }
}