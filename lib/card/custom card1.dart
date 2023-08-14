import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customcard1 extends StatefulWidget {
  const customcard1({Key? key,this.data}) : super(key: key);
  final data;
  @override
  State<customcard1> createState() => _customcard1State();
}

class _customcard1State extends State<customcard1> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.all(10.0),
      margin:EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("  الاسم: ${widget.data["name"]}",style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),),
              Text("الرقم القومي : ${widget.data["uid"]}",style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),),
              Text("تاريخ الميلاد  : ${widget.data["birthday"]}",style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),),
              Text("الفون  : ${widget.data["phone"]}",style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),),


            ],
          ),
          SizedBox(width: 10.0,),
          CircleAvatar(
            backgroundImage: NetworkImage('${widget.data["image"]}'),
            radius: 45,
          ),


        ],

      ),
    );

  }
}
