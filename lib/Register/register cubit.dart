
import 'package:abonaatomas/Login/Social_User_Model.dart';
import 'package:abonaatomas/Register/register%20states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubitRegister extends Cubit<ChatRegisterStates>
{
  ChatCubitRegister() : super(InitialRegisterState());
  static ChatCubitRegister get(context) => BlocProvider.of(context);
  bool ispass = true;
  IconData suffix = Icons.visibility;
  void userCreate({
    required String email,
    required String name,
    required String phone,
    required String uid,
  })
  {
ChatUserModel model=ChatUserModel(
  name: name,
  email: email,
  phone: phone,
  uid: uid,
);
FirebaseFirestore.instance.collection('users').doc(uid)
    .set(model.toMap()).then((value){
      emit(SuccessCreateUserState());
}).catchError((error){
emit(ErrorCreateUserState(error.toString()));
});
  }
  void changePass() {
    if (ispass == false) {
      ispass = true;
      suffix = Icons.visibility;
    }
    else {
      ispass = false;
      suffix = Icons.visibility_off;
    }
    emit(ChangePassRegisterState());
  }
  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  })
  {
    emit(LoadingRegisterState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email:email ,
      password: password,
    ).then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      userCreate(
        email:email,
          name:name,
          phone:phone ,
          uid:value.user!.uid,

      );
     }).catchError((error){
      emit(ErrorRegisterState(error.toString()));
    });

  }
}