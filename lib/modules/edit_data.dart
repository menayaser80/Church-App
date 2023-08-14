import 'package:flutter/material.dart';

class edit_data extends StatefulWidget {
  edit_data({Key? key}) : super(key: key);

  @override
  State<edit_data> createState() => _edit_dataState();
}

class _edit_dataState extends State<edit_data> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: const Text("تعديل البيانات الزوج",),),
    body: ListView(children: [
Column
  (
  children: [
    SizedBox(
      height: 10.0,
    ),
  onclick(icon:Icons.person,
  text: 'تعديل الاسم',
  )
],)
    ],),
    );
  }
}


class onclick extends StatelessWidget {
  const onclick({Key? key, this.text, required this.icon, this.ontap}) : super(key: key);
final text ;
final IconData icon ;
final Function()? ontap ;
  @override
  Widget build(BuildContext context) {
    return    Material(
          borderRadius: BorderRadius.circular(100),
          shadowColor: Colors.grey,

          child: InkWell(
          hoverColor:  Color(0xffA3BB00),
          splashColor:Color.fromARGB(255, 153, 153, 153),
          borderRadius: BorderRadius.circular(100),

          onTap:ontap,
          child: Ink(
            width: 400,height: 50 ,
            //margin: EdgeInsets.all(margin!) ,
            decoration: BoxDecoration(
              color: Colors.white ,
   borderRadius: BorderRadius.circular(100) ,

     border: Border.all(width: 2,color: Color(0xffA3BB00),),
            ),
            child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children:  [
                Text(text,
                  style: const TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),),
                const SizedBox(width: 6,),
                Icon(icon),
                const SizedBox(width: 15,),

            ],),

          ),
    ),
      );
  }
}