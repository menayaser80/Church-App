import 'package:abonaatomas/dark%20mode/cashe%20helper.dart';
import 'package:abonaatomas/dark%20mode/states.dart';
import 'package:abonaatomas/modules/children.dart';
import 'package:abonaatomas/modules/female.dart';
import 'package:abonaatomas/modules/male.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit <NewsStates>
{
  AppCubit():super(NewsInitialState());
  static AppCubit get (context)=>BlocProvider.of(context);

  bool isdark =false;
  void changeappmode({bool? fromshared})
  {
    if(fromshared !=null)
    {
      isdark=fromshared;
      emit(AppChangeDarkState());
    }
    else
    {
      isdark=!isdark;
      CachHelper.putBoolean(key:'isdark', value:isdark).then((value){
        emit(AppChangeDarkState());
      });
    }
  }
  int currentindex=0;
  List<Widget>screens=[
    Male(),
    Female(),
    Childrens(),
  ];
}