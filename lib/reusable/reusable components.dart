import 'package:abonaatomas/church%20Cubit/bloc.dart';
import 'package:abonaatomas/modules/children.dart';
import 'package:abonaatomas/modules/male.dart';
import 'package:abonaatomas/reusable/colors.dart';
import 'package:abonaatomas/reusable/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'colors.dart';
Widget myDivider()=>Padding(
  padding: EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],

  ),
);

Widget defaultformfield({
  required TextEditingController controller,
  required TextInputType type,
  Function(String x)?onchange,
  required String? Function(String?val)?validator,
  required String label,
  required IconData prefix,
})=> TextFormField(
    controller: controller,
    decoration: InputDecoration(
      prefixIcon: Icon(
        prefix,
      ),
      labelText: label,
      border: OutlineInputBorder(),
    ),
    validator: validator,

    keyboardType:type,
    onChanged:onchange
);
Widget defaultpassword({
  required TextEditingController controller,
  required TextInputType type,
  Function(String x)?onchange,
  Function(String x)?onsubmit,
  required String? Function(String?val)?validator,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool ispassword=false,
  VoidCallback? suffixpressed,
})=>TextFormField(
  controller: controller,
  decoration: InputDecoration(
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: suffix!=null?IconButton(
      onPressed:suffixpressed,
      icon:   Icon(
        suffix,
      ),
    ):null,
    labelText: label,
    border: OutlineInputBorder(),
  ),
  validator: validator,
  keyboardType:type,
  obscureText: ispassword,
  onChanged: onchange,
  onFieldSubmitted:onsubmit,
);
void navigateTo(context,Widget)=>Navigator.push(context, MaterialPageRoute(
  builder:(context)=>Widget,
));

void navigateandFinish(context,Widget)=>Navigator.pushAndRemoveUntil(context,MaterialPageRoute(
  builder: (context)=>Widget,
),
      (route)
  {
    return false;
  },
);
Widget defaulttextbutton({
  required VoidCallback function,
  required String text,
})=>  TextButton(
  onPressed: function,
  child:Text(text.toUpperCase(),),
);
void showToast({
  required String text ,
  required ToastColor state ,
}) =>  Fluttertoast.showToast(
  msg: text,
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 5,
  backgroundColor: ChangeToastColor(state),
  textColor: Colors.white,
  fontSize: 16.0,
);
enum ToastColor {SUCCESS,ERROR,WARNING}
Color ChangeToastColor(ToastColor state)
{
  Color color;
  switch(state){
    case ToastColor.SUCCESS:
      color = Colors.green;
      break;
    case ToastColor.ERROR:
      color = Colors.red;
      break;
    case ToastColor.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
Widget defaultButton({

  Color? background,
  bool isUppercase = true,
  double raduis = 10,
  @required Function()? function,
  @required String? text,
}) =>
    Container(

      child: MaterialButton(
        onPressed: function,
        height: 45.0,
        color: fontColor,
        child: Text(
          isUppercase ? text!.toUpperCase() : text!,
          style: TextStyle(fontSize: 13, color: Colors.white),
        ),
      ),
    );
Widget defaultform({
  required TextEditingController controller,
  required TextInputType type,
  Function(String x)?onchange,
  required String? Function(String?val)?validator,
  required String label,
  required IconData prefix,
  VoidCallback? ontap,
  bool isclickable=true,
})=> TextFormField(
  controller: controller,
  decoration: InputDecoration(
    prefixIcon: Icon(
      prefix,
    ),
    labelText: label,
    border: OutlineInputBorder(),
  ),
  validator: validator,
  onTap: ontap,
  keyboardType:type,
  onChanged:onchange,
  enabled: isclickable,

);
String uid = '';
showloding (context){

  return showDialog(
      barrierDismissible : false,
      context: context, builder: (context){
    return AlertDialog(
        backgroundColor: Color.fromARGB(166, 0, 0, 0),
        actionsAlignment: MainAxisAlignment.center,
        title: const Center(child: Text("الرجاء الإنتظار",style: TextStyle(fontFamily: "Cairo" , color: Colors.white),),),
        // ignore: sized_box_for_whitespace
        content: Container(
          height: 50,
          child:
          const Center(child:
          CircularProgressIndicator(color: Color.fromARGB(255, 255, 255, 255))
            ,)
          ,),
      );

  });


}
