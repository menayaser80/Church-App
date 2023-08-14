import 'package:abonaatomas/card/custom%20card1.dart';
import 'package:abonaatomas/modules/edit_data.dart';
import 'package:abonaatomas/reusable/colors.dart';
import 'package:abonaatomas/reusable/reusable%20components.dart';
import 'package:abonaatomas/show%20children.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Show extends StatefulWidget {
  const Show({Key? key,this.id, this.m_data, this.f_data, this.m_name, this.f_name, this.m_id, this.f_id,}) : super(key: key);
final id ;
final m_data ;
final f_data ;
final m_name;
final f_name ;
final m_id;
final f_id;
  @override
  State<Show> createState() => _ShowState();
}

class _ShowState extends State<Show> {
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  bool vis=false;
  var number;
  checkchildre()async{
    users.doc(widget.id).collection('children').snapshots().listen((event) {
      setState(() {
        number = event.docs.length;
        if(number == 0){
          vis = false;
        }else{
          vis = true;
        }
      });
  });
  }
  @override
  void initState() {
    super.initState();
    checkchildre();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
                 ListView(children: [

                   Column(
                     children: [
                       SizedBox(
                         width: 400,
                         child: Column(
                           children: [
                             Text('بيانات الاسرة',style: TextStyle(
                               fontSize: 30.0,
                               fontWeight: FontWeight.bold,
                             ),),
                             SizedBox(
                               height: 30.0,
                             ),
                             customcard1(data: widget.m_data,),
                             customcard1(data: widget.f_data,),
                             Column(
                               children: [
                                 Visibility(
                             visible:vis,
                             child: Container(
                                     width: 250.0,
                                     color: fontColor,
                                     child: MaterialButton(onPressed: (){
navigateTo(context,Showchild(doc: widget.id,));
                                     },child: Text('اظهار الاولاد',style: TextStyle(
                                       fontSize: 15.0,
                                       fontWeight: FontWeight.bold,
                                       color: Colors.white
                                     ),),),
                                   ),
                                 ),
                                 SizedBox(
                                   height: 10.0,
                                 ),
                                 Container(
                                   width: 250.0,
                                   color: textColor,
                                   child: MaterialButton(onPressed: (){
                                     navigateTo(context,edit_data());
                                   },child: Text('تعديل بيانات الاسرة',style: TextStyle(
                                       fontSize: 15.0,
                                       fontWeight: FontWeight.bold,
                                       color: Colors.white
                                   ),),),
                                 ),
                               ],
                             ),

                           ],
                         ),
                       ),
                     ],
                   ),





                ],)

  );
  }
}


