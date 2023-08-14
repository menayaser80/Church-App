import 'package:abonaatomas/Login/social%20login.dart';
import 'package:abonaatomas/Register/register%20cubit.dart';
import 'package:abonaatomas/Register/register%20states.dart';
import 'package:abonaatomas/reusable/reusable%20components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatRegister extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var passwordcontroller= TextEditingController();
  var namecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ChatCubitRegister(),
      child: BlocConsumer<ChatCubitRegister,ChatRegisterStates>(
        listener: (context, state)
        {
          if(state is SuccessCreateUserState)
          {
navigateandFinish(context, ChatLogin(),);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body : Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Image.asset('assets/images/ring.jpg')),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultformfield(
                          controller: namecontroller,
                          type: TextInputType.name,
                          validator: (value)
                          {
                            if(value!.isEmpty&&value!=null)
                            {
                              return 'please enter your name';
                            }
                          },
                          label: 'User Name',
                          prefix: Icons.person,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
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
                        defaultpassword(
                            controller: passwordcontroller,
                            type: TextInputType.visiblePassword,
                            onsubmit: (value)
                            {

                            },
                            validator: (value)
                            {
                              if(value!.isEmpty&&value!=null)
                              {
                                return ' password is too short';
                              }
                            },
                            label: 'password',
                            ispassword:  ChatCubitRegister.get(context).ispass,
                            prefix: Icons.lock_outline,
                            suffix:  ChatCubitRegister.get(context).suffix,
                            suffixpressed: (){
                              ChatCubitRegister.get(context).changePass();
                            }
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultformfield(
                          controller: phonecontroller,
                          type: TextInputType.phone,
                          validator: (value)
                          {
                            if(value!.isEmpty&&value!=null)
                            {
                              return 'please enter your phone number';
                            }
                          },
                          label: 'phone',
                          prefix: Icons.phone,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        ConditionalBuilder(
                          condition:state is !LoadingRegisterState,
                          builder: (context)=>Container(
                              width: double.infinity,
                              color: Colors.blue,
                              child: MaterialButton(onPressed: (){
                                if(formKey.currentState!.validate())
                                {
                                  ChatCubitRegister.get(context).
                                  userRegister(
                                    email:emailcontroller.text,
                                    password:passwordcontroller.text,
                                    phone: phonecontroller.text,
                                    name: namecontroller.text,
                                  );
                                }
                              },child: Text('register',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.white,
                              ),),)),
                          fallback:(context)=>Center(child: CircularProgressIndicator()),
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