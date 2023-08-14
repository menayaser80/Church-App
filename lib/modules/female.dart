import 'dart:io';
import 'dart:math';
import 'package:abonaatomas/church%20Cubit/female%20model.dart';
import 'package:abonaatomas/modules/children.dart';
import 'package:abonaatomas/modules/design.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'package:abonaatomas/church%20Cubit/bloc.dart';
import 'package:abonaatomas/church%20Cubit/states.dart';
import 'package:abonaatomas/reusable/colors.dart';
import 'package:abonaatomas/reusable/reusable%20components.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../dark mode/cashe helper.dart';

class Female extends StatefulWidget {
   Female({Key? key, this.m_name,this.m_uid,this.m_data}) : super(key: key);
  final m_name ;
  final m_uid ;
  final m_data ;
  @override
  State<Female> createState() => _FemaleState();
}

class _FemaleState extends State<Female> {
  var imageUR;
File? file;
  int? counter;
var imagepicker=ImagePicker();
  var male = ['ذكر', 'انثي'];
  var female=['السيد','السيدة','المرحوم','المرحومة','منفصل','منفصلة','مرتد','مرتدة'];
  String?selecteditem;
  String?selectedgender;
  String?x;
  var fe = 'السيدة';
  bool usa = false;
  bool ny = false;
  var ma = 'ذكر';
  dynamic data;
  XFile? image;
  var code = TextEditingController();
  var datecontroller = TextEditingController();
  var name = TextEditingController();
  var dropvalue = TextEditingController();
  var gender = TextEditingController();
  var uid = TextEditingController();
  var phone = TextEditingController();
  var mobile = TextEditingController();
  var govern = TextEditingController();
  var qualify = TextEditingController();
  var job = TextEditingController();
  var age = TextEditingController();
  var birthday = TextEditingController();
  var healthy = TextEditingController();
  var malee = TextEditingController();
  var imagee = TextEditingController();

  XFile?  Femaleimage;
  @override
  void dispose() {
    code.dispose();
    name.dispose();
    datecontroller.dispose();
    gender.dispose();
    dropvalue.dispose();
    uid.dispose();
    phone.dispose();
    mobile.dispose();
    govern.dispose();
    qualify.dispose();
    job.dispose();
    age.dispose();
    birthday.dispose();
    healthy.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialCubit()..getUserData(),
      child: BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state)
        {},
        builder: (context, state)
        {
          if (state is SocialGetUserLoadingState) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          }else{
            return  Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 35.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                                width: 150.0,
                                height: 25.0,
                                color: textColorActive, //#FAC090
                                child: TextFormField(
                                  controller: uid,
                                  keyboardType: TextInputType.phone,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 30.0,
                              width: 90,
                              color: mainColor,
                              child: Center(
                                child: Text(
                                  'الرقم القومي',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            BlocBuilder<SocialCubit , SocialStates>(
                              builder:(context, state) => Container(
                                width: 40.0,
                                height: 25.0,
                                color: textColorActive,
                                child:  Center(
                                  child:Text('${(CachHelper.getData(key: "counter") ?? SocialCubit.get(context).counter ) } '),),
                              ),
                            ),
                            SizedBox(
                              width: 1.5,
                            ),
                            Container(
                              height: 25.0,
                              width: 30,
                              color: mainColor,
                              child: Center(
                                child: Text(
                                  'م',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                width: 230.0,
                                height: 25.0,
                                color: textColorActive, //#FAC090
                                child: TextFormField(
                                  controller: name,
                                )),
                            Container(
                              height: 40.0,
                              width: 100.0,
                              color: Colors.white,
                              child: DropdownButton<String>(
                                items: female.map((String item) {
                                  return DropdownMenuItem<String>(
                                    onTap: (){
                                      setState(() {
                                        selecteditem=item;
                                      });
                                    },
                                    value: item,
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Colors.red,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? thelang) {
                                  setState(() {
                                    fe = thelang!;
                                  });
                                },
                                value: fe,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 40.0,
                                            width: 80.0,
                                            color: Colors.white,
                                            child: DropdownButton<String>(
                                              items: male.map((String item) {
                                                return DropdownMenuItem<String>(
                                                  onTap: (){
                                                    setState(() {
                                                      selectedgender=item;
                                                    });
                                                  },
                                                  value: item,
                                                  child: Text(
                                                    item,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 18.0,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (String? thelang) {
                                                setState(() {
                                                  ma = thelang!;
                                                });
                                              },
                                              value: ma,
                                            ),
                                          ),
                                          Center(
                                              child: Text(
                                                ':النوع',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0,
                                                ),
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 40.0,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 40.0,
                                            width: 85.0,
                                            child: TextFormField(
                                              controller: govern,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                          Center(
                                              child: Text(
                                                'محافظةالميلاد',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0,
                                                ),
                                              )),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 40.0,
                                            width: 140.0,
                                            child: TextFormField(
                                              controller: phone,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                              ),
                                              keyboardType: TextInputType.phone,
                                            ),
                                          ),
                                          Center(
                                              child: Text(
                                                ':فون',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0,
                                                ),
                                              )),
                                          SizedBox(
                                            height: 0.4,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 40.0,
                                              width: 130.0,
                                              child: TextFormField(
                                                controller:mobile,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            Center(
                                                child: Text(
                                                  ':ت',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.0,
                                                  ),
                                                )),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 40.0,
                                              width: 113.0,
                                              child: TextFormField(
                                                controller: qualify,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            Center(
                                                child: Text(
                                                  'مؤهل',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.0,
                                                  ),
                                                )),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                                height: 40.0,
                                                width: 115.0,
                                                child: TextFormField(
                                                  controller: job,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(),
                                                  ),
                                                )),
                                            Center(
                                                child: Text(
                                                  'العمل',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.0,
                                                  ),
                                                )),
                                          ],
                                        ),

                                        Row(
                                          children: [
                                            Container(
                                                height: 40.0,
                                                width: 110.0,
                                                child: TextFormField(
                                                  controller: age,
                                                  keyboardType: TextInputType.phone,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(),
                                                  ),
                                                )),
                                            Center(
                                                child: Text(
                                                  'السن',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.0,
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 40.0,
                                    width: 239,
                                    child: defaultform(
                                      controller: datecontroller,
                                      type: TextInputType.datetime,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'date must not be empty';
                                        }
                                        return null;
                                      },
                                      ontap: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime.now()
                                              .add(const Duration(days: 1000)),
                                        ).then((value) {
                                          setState(() {
                                            x = value.toString();
                                          });
                                          datecontroller.text =
                                              DateFormat.yMMMd().format(value!);
                                        });
                                      },
                                      label: 'Task Date',
                                      prefix: Icons.calendar_today,
                                    ),
                                  ),
                                  Center(
                                      child: Text(
                                        ':تاريخ الميلاد',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      )),
                                  SizedBox(
                                    height: 0.4,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                              value: usa,
                                              onChanged: (value) {
                                                setState(() {
                                                  usa = value!;
                                                });
                                              }),
                                          Text(
                                            'غذاء الزوج',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Checkbox(
                                              value: ny,
                                              onChanged: (value) {
                                                setState(() {
                                                  ny = value!;
                                                });
                                              }),
                                          Text(
                                            'كساء الزوج',
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 90.0,
                                    width: 110.0,
                                    child: TextFormField(
                                      controller: healthy,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  Center(
                                      child: Text(
                                        'الحالة الصحية ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      )),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    color: itemColor,
                                    width: 200,
                                    child: Center(
                                      child: Text(
                                        'صور ومرفقات',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showCupertinoModalPopup(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                height: 200,
                                                width: 245,
                                                padding: const EdgeInsets.only(
                                                  top: 20,
                                                  bottom: 20,
                                                  left: 80,
                                                  right: 30,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white.withOpacity(0.5),
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () async {
                                                        Femaleimage=await imagepicker.pickImage(source: ImageSource.gallery);
                                                        if(Femaleimage!=null)
                                                        {
                                                          file=File(Femaleimage!.path);
                                                          var nameimage=basename(Femaleimage!.path);
                                                          print(nameimage);
                                                          var random=Random().nextInt(1000000000);
                                                          nameimage='$random$nameimage';

                                                          setState(() {
                                                          });
                                                        }
                                                        else{
                                                          print('please choose image');
                                                        }
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(20.0),
                                                          color: Color(0xfff0d8fa),
                                                        ),
                                                        height: 50.0,
                                                        width: 150.0,
                                                        child: Row(
                                                          children: [
                                                            Image(
                                                              image: AssetImage(
                                                                  'assets/images/gallery.png'),
                                                            ),
                                                            Material(
                                                              child: Text(
                                                                'المعرض',
                                                                style: TextStyle(
                                                                  fontSize: 20.0,
                                                                  color: Colors.black,
                                                                  fontWeight:
                                                                  FontWeight.bold,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 40.0,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        Femaleimage=await imagepicker.pickImage(source: ImageSource.camera);
if(Femaleimage!=null)
  {
    file=File(Femaleimage!.path);
    var nameimage=basename(Femaleimage!.path);
    print(nameimage);
    setState(() {
    });
  }
else{
  print('please choose image');
}
Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(20.0),
                                                          color: Color(0xffecf6ff),
                                                        ),
                                                        height: 40.0,
                                                        width: 250.0,
                                                        child: Row(
                                                          children: [
                                                            Image(
                                                              image: AssetImage(
                                                                  'assets/images/cam.png'),
                                                            ),
                                                            Material(
                                                              child: Text(
                                                                'الكاميرا',
                                                                style: TextStyle(
                                                                  fontSize: 23,
                                                                  fontWeight:
                                                                  FontWeight.bold,
                                                                  color: Colors.black,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    child: Container(
                                      width: 200.0,
                                      height: 150.0,
                                      color: playColor,
                                      child: Femaleimage != null ?Image.file(File(Femaleimage!.path),height: 100,) : Center(child: Text('Image Hhere'),),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Center(
                                  child: Container(
                                    height: 40.0,
                                    width: 80.0,
                                    color: fontColor,
                                    child:state is SocialUseraddLoadingState
                                  ? const Center(
                                  child: CircularProgressIndicator
                                      .adaptive(),
                                ):MaterialButton(
                                      onPressed: () async{
                                        showloding(context);
                                            var refstorage=FirebaseStorage.instance.ref(file!.path);
await refstorage.putFile(file!);
imageUR  =await refstorage.getDownloadURL();
print('url:$imageUR');
Map f_data = {
  "uid": uid.text,
  "name":name.text ,
  "dropvalue": selecteditem,
  "gender": selectedgender,
  "image": imageUR,
  "birthday": x,
  "male": ny,
  "clothes":usa,
  "age":age.text,
  "govern":govern.text ,
  "healthy":healthy.text ,
  "job":job.text ,
  "mobile":mobile.text ,
  "phone": phone.text,
  "qualify":qualify.text ,
  "userid": FirebaseAuth.instance.currentUser!.uid,
};
/*
SocialCubit.get(context).Adddatafemale(model:femalee(
  uid: uid.text,
  name:name.text ,
  dropvalue: selecteditem,
  gender: selectedgender,
  image: imageUR,
   birthday: x,
   male: ny,
  clothes:usa,
  age:age.text,
  govern:govern.text ,
  healthy:healthy.text ,
  job:job.text ,
  mobile:mobile.text ,
  phone: phone.text,
  qualify:qualify.text ,
  userid: FirebaseAuth.instance.currentUser!.uid,
), gender: "female" , counter: (CachHelper.getData(key: "counter") ?? SocialCubit.get(context).counter ), ).*/
//then((value) async{
 var adad = CachHelper.getData(key: "counter") ?? SocialCubit.get(context).counter;

  await FirebaseFirestore.instance
      .collection('users')
      .doc('$adad').set({
    "m_data" : widget.m_data ,
    "f_data" : f_data ,
    "id" : adad.toString(),
    "f_id" : uid.text ,
    "f_name" : name.text ,
    "m_id" :widget.m_uid ,
    "m_name" :widget.m_name,
  }).whenComplete(() async{
    Navigator.pop(context);
     showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('هل لديهم اطفال',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),),
        content: Container(
          height:50.0,
          child:Row(
            children: [
              Expanded(
                child: defaultButton(text: 'نعم',
                      function:(){
                        navigateTo(context,Childrens());
                      }),
              ),
              BlocBuilder<SocialCubit , SocialStates>(
                builder:(context, state) =>  Expanded(
                      child: defaultButton(text: ' لا والانتهاء من عملية التسجيل' , function:(){
                        SocialCubit.get(context).addToCounter();

                        navigateTo(context,Design());
                      })),
              ),
            ],
          ),
        ),
      );
    });
  });


//});
},
                                      child:Text(
                                        'اضافة',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
  _clear(){
    setState(() {
      Femaleimage = null;
      name.clear;
      datecontroller.clear;
      gender.clear;
      dropvalue.clear;
      uid.clear;
      phone.clear;
      mobile.clear;
      govern.clear;
      qualify.clear;
      job.clear;
      age.clear;
      birthday.clear;
      healthy.clear;
      usa = false;

    });
  }
}
