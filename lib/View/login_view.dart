import 'package:flutter/material.dart';
import 'package:lcms_app/Utils/utils.dart';
import 'package:lcms_app/res/Components/button.dart';
import 'package:lcms_app/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _usernameController.dispose();
    _passwordController.dispose();

    usernameFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();

  }

  @override
  Widget build(BuildContext context) {


    final authViewModel= Provider.of<AuthViewModel>(context);
    final height  = MediaQuery.of(context).size.height * 1 ;
    return 
      SafeArea(
        child: Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   title: Center(child: Text('Login')),
        // ),
        body:
        SingleChildScrollView(
          child: Padding(

            padding: const EdgeInsets.all(12.0),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200.0,
                  height: 200.0,
                  child: const Center(
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/image12.png'),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.09,),

                Container(
                decoration: BoxDecoration(
                color: Color(0xff8592a1).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)
              ),
                child: TextFormField(
                  controller: _usernameController,
                  focusNode: usernameFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    prefixIcon: Icon(Icons.alternate_email),
                  ),
                  onFieldSubmitted: (value){
                    utilities.fieldFocusChange(context, usernameFocusNode, passwordFocusNode);
                  },
                )
                ),

                SizedBox(
                  height:  height * .025,
                ),

                ValueListenableBuilder(
                    valueListenable: _obsecurePassword,
                    builder: (context,value,child){
                      return Container(
                          decoration: BoxDecoration(
                          color: Color(0xff8592a1).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      ),
                      child:TextFormField(
                        controller: _passwordController,
                        obscureText: _obsecurePassword.value,
                        obscuringCharacter: '*',
                        focusNode: passwordFocusNode,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: InkWell(
                              onTap: (){
                                _obsecurePassword.value = !_obsecurePassword.value ;
                              },
                              child: Icon(
                                  _obsecurePassword.value ?  Icons.visibility_off_outlined :
                                  Icons.visibility
                              )),
                        ),
                      )
                      );
                    }
                ),
                SizedBox(
                  height:  height * 0.085,
                ),

                myButton(
                    title: 'Login',
                    loading: authViewModel.loading,
                    onPress: (){
                  if (_usernameController.text.isEmpty){

                    utilities.flushBarErrorMessage('Please Enter Username', context);
                  }
                  else if (_passwordController.text.isEmpty){
                    utilities.flushBarErrorMessage('Please Enter Password', context);
                  }
                  else {
                    Map data = {
                      'username' : _usernameController.text.toString(),
                      'password' : _passwordController.text.toString(),
                    };
                    authViewModel.loginApi(data, context);
                    //authViewModel.setLoading(true);
                    print('API Hit');

                  }


                    })


              ],
            ),
          ),
        ),
    ),
      );
  }
}
