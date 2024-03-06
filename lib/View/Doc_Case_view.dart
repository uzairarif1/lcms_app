import 'package:flutter/material.dart';
import 'package:lcms_app/View/UploadDocument_View.dart';
import 'package:provider/provider.dart';

import '../Data/response/status.dart';
import '../Utils/drawer.dart';
import '../res/colors.dart';
import '../view_model/cases_vm.dart';
import '../view_model/user_viewmodel.dart';

class DocumentCaseScreen extends StatefulWidget {
  const DocumentCaseScreen({Key? key}) : super(key: key);

  @override
  State<DocumentCaseScreen> createState() => _DocumentCaseScreenState();
}

class _DocumentCaseScreenState extends State<DocumentCaseScreen> {
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
              title: const Text("Upload Document",style: TextStyle(fontFamily: 'Roboto_Slab_Bold',fontSize: 24),),
              centerTitle: true,
            ),

            drawer: NavDrawer(),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.drawerheadColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Select Case',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Roboto_Slab_Bold'
                    ),
                  ),
                ),
            ),
              ),
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
                                  return InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => UploadImageScreen()));
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

                                            const SizedBox(height: 5  ,),
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
