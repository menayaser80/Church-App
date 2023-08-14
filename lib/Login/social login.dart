import 'package:abonaatomas/Login/login%20cubit.dart';
import 'package:abonaatomas/Login/login%20states.dart';
import 'package:abonaatomas/Register/register%20screen.dart';
import 'package:abonaatomas/dark%20mode/cashe%20helper.dart';
import 'package:abonaatomas/dark%20mode/cubit.dart';
import 'package:abonaatomas/modules/design.dart';
import 'package:abonaatomas/reusable/reusable%20components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatLogin extends StatelessWidget {
  var formkey=GlobalKey<FormState>();
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var passwordcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ChatLoginCubit(),
      child: BlocConsumer<ChatLoginCubit,ChatLoginStates>(
      listener: (context,state)
      {
      if(state is ChatLoginErrorState)
        {
          showToast(
              text:state.error,
              state:ToastColor.ERROR,
          );
        }
      if(state is ChatLoginSuccessState)
        {
          CachHelper.saveData(
              key: 'uid',
              value: state.uid,
          ).then((value) {
            navigateandFinish(context,Design());
          });
        }
      },
        builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            leading:   IconButton(onPressed: (){
              AppCubit.get(context).changeappmode();
            }, icon: Icon(
              Icons.brightness_4_outlined,
            ),
            ),
            title: Text(
              'church',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Image.asset('assets/images/ring.jpg')),
                     SizedBox(
                       height: 50.0,
                     ),
                     SingleChildScrollView(
                       child: Column(
                         children: [
                           defaultformfield(
                             controller: emailcontroller,
                             type: TextInputType.emailAddress,
                             validator: (value)
                             {
                               if(value!.isEmpty&&value!=null)
                               {
                                 return ' email address must not be empty';
                               }
                             },
                             label: 'Email Address',
                             prefix: Icons.email_outlined,
                           ),
                           SizedBox(
                             height: 15.0,
                           ),
                           defaultpassword(controller: passwordcontroller,
                               type: TextInputType.visiblePassword,
                               onsubmit: (value)
                               {
                                 if(formkey.currentState!.validate())
                                 {
                                   ChatLoginCubit.get(context).
                                   userlogin(email:emailcontroller.text,
                                       password:passwordcontroller.text);
                                 }
                               },
                               validator: (value)
                               {
                                 if(value!.isEmpty&&value!=null)
                                 {
                                   return ' password is too short';
                                 }
                               },
                               label: 'password',
                               ispassword:  ChatLoginCubit.get(context).isPassword,
                               prefix: Icons.lock_outline,
                               suffix:  ChatLoginCubit.get(context).suffix,
                               suffixpressed: (){
                                 ChatLoginCubit.get(context).changepasswordvisibility();
                               }
                           ),
                           SizedBox(
                             height: 30.0,
                           ),
                           ConditionalBuilder(
                             condition:state is!ChatLoginLoadingState,
                             builder: (context)=>Container(
                                 width: double.infinity,
                                 color: Colors.blue,
                                 child: MaterialButton(onPressed: (){
                                   if(formkey.currentState!.validate())
                                   {
                                     ChatLoginCubit.get(context).
                                     userlogin(email:emailcontroller.text,
                                         password:passwordcontroller.text);
                                   }
                                 },child: Text('Login',style: TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize: 20.0,
                                   color: Colors.white,
                                 ),),)),
                             fallback:(context)=>Center(child: CircularProgressIndicator()),
                           ),

                           SizedBox(
                             height: 15.0,
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text('Don\'t have an account?'),
                               defaulttextbutton(
                                 function: (){
                                   Navigator.push(context, MaterialPageRoute(
                                     builder:(context)=>ChatRegister(),
                                   ));
                                 },
                                 text:'register',
                               ),
                             ],
                           ),

                           Container(
                             height: 40.0,
                               width: 80.0,
                               color: Colors.grey[200],
                               child: MaterialButton(onPressed: (){
                                 navigateTo(context, Design());
                               },child: Text('Skip'),)),
                         ],
                       ),
                     ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
        },
      ),
    );
  }
}
