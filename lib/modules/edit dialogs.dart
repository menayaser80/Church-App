import 'package:abonaatomas/reusable/colors.dart';
import 'package:flutter/material.dart';

class Edit_name extends StatefulWidget {
  const Edit_name({Key? key}) : super(key: key);

  @override
  State<Edit_name> createState() => _Edit_nameState();
}

class _Edit_nameState extends State<Edit_name> {
  var name;
  GlobalKey<FormState> _form =  GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _form,
        child: Column(
          children: [
            Text('ما هو الاسم الجديد',style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 15.0,
            ),),
            Container(
              width: 300.0,
              child: TextFormField(
                onChanged: (v){
                  name = v ;
                },
              ),
            ),
            Container(
              color: fontColor,
              child: MaterialButton(onPressed: (){
                },child: Text('تعديل',style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 15.0,
              ),),),
            )

          ],
        ),
      ),
    );
  }
}
