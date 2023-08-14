import 'dart:io';
import 'dart:math';
import 'package:abonaatomas/dark%20mode/cashe%20helper.dart';
import 'package:abonaatomas/modules/female.dart';
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


class Male extends StatefulWidget {
  @override
  State<Male> createState() => _MaleState();
}

class _MaleState extends State<Male> {
  var imageU;
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
  var name = TextEditingController();
  var datecontroller = TextEditingController();
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
  var formKey = GlobalKey<FormState>();

  XFile?  Maleimage;

  @override
  void dispose() {
    name.dispose();
    datecontroller.dispose();
    gender.dispose();
    dropvalue.dispose();
    uid.dispose();
    phone.dispose();
    mobile.dispose();
    govern.dispose();
    qualify.dispose();job.dispose();
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
                  child: Form(
                    key: formKey,
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
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 30.0,
                              width: 90,
                              color: mainColor,
                              child: const Center(
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
                            const SizedBox(
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

                            const SizedBox(
                              width: 1.5,
                            ),
                            Container(
                              height: 25.0,
                              width: 30,
                              color: mainColor,
                              child: const Center(
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
                                      style: const TextStyle(
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
                                                    style: const TextStyle(
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
                                          const Center(
                                              child: Text(
                                                ':النوع',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0,
                                                ),
                                              )),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 40.0,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 40.0,
                                            width: 85.0,
                                            child: TextFormField(
                                              controller: govern,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                          const Center(
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
                                          SizedBox(
                                            height: 40.0,
                                            width: 140.0,
                                            child: TextFormField(
                                              controller: phone,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                              ),
                                              keyboardType: TextInputType.phone,
                                            ),
                                          ),
                                          const Center(
                                              child: Text(
                                                ':فون',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0,
                                                ),
                                              )),
                                          const SizedBox(
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
                                            SizedBox(
                                              height: 40.0,
                                              width: 130.0,
                                              child: TextFormField(
                                                keyboardType: TextInputType.phone,
                                                controller:mobile,
                                                decoration: const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            const Center(
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
                                            SizedBox(
                                              height: 40.0,
                                              width: 113.0,
                                              child: TextFormField(
                                                controller: qualify,
                                                decoration: const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            const Center(
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
                                            SizedBox(
                                                height: 40.0,
                                                width: 115.0,
                                                child: TextFormField(
                                                  controller: job,
                                                  decoration: const InputDecoration(
                                                    border: OutlineInputBorder(),
                                                  ),
                                                )),
                                            const Center(
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
                                            SizedBox(
                                                height: 40.0,
                                                width: 110.0,
                                                child: TextFormField(
                                                  controller: age,
                                                  keyboardType: TextInputType.phone,
                                                  decoration: const InputDecoration(
                                                    border: OutlineInputBorder(),
                                                  ),
                                                )),
                                            const Center(
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
                                  SizedBox(
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
                                          });                                        datecontroller.text =
                                              DateFormat.yMMMd().format(value!);
                                        });
                                      },
                                      label: 'Task Date',
                                      prefix: Icons.calendar_today,
                                    ),
                                  ),
                                  const Center(
                                      child: Text(
                                        ':تاريخ الميلاد',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      )),
                                  const SizedBox(
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
                                          const Text(
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
                                          const Text(
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
                                  SizedBox(
                                    height: 90.0,
                                    width: 110.0,
                                    child: TextFormField(
                                      controller: healthy,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  const Center(
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
                                    child: const Center(
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
                                                        Maleimage=await imagepicker.pickImage(source: ImageSource.gallery);
                                                        if(Maleimage!=null)
                                                        {
                                                          file=File(Maleimage!.path);
                                                          var nameimage=basename(Maleimage!.path);
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
                                                          color: const Color(0xfff0d8fa),
                                                        ),
                                                        height: 50.0,
                                                        width: 150.0,
                                                        child: Row(
                                                          children: [
                                                            const Image(
                                                              image: AssetImage(
                                                                  'assets/images/gallery.png'),
                                                            ),
                                                            const Material(
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
                                                    const SizedBox(
                                                      height: 40.0,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () async {
                                                        Maleimage=await imagepicker.pickImage(source: ImageSource.camera);
                                                        if(Maleimage!=null)
                                                        {
                                                          file=File(Maleimage!.path);
                                                          var nameimage=basename(Maleimage!.path);
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
                                                          color: const Color(0xffecf6ff),
                                                        ),
                                                        height: 40.0,
                                                        width: 250.0,
                                                        child: Row(
                                                          children: [
                                                            const Image(
                                                              image: AssetImage(
                                                                  'assets/images/cam.png'),
                                                            ),
                                                            const Material(
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
                                      child: Maleimage != null ?Image.file(File(Maleimage!.path),height: 100,) : const Center(child: Text('Image Hhere'),),
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
                                    ): MaterialButton(
                                      onPressed: () async{
                                        var refstorage=FirebaseStorage.instance.ref(file!.path);
                                        await refstorage.putFile(file!);
                                        imageU  =await refstorage.getDownloadURL();
                                     //   print('url:$imageU');

                                        Map m_data = {
                                          "uid": uid.text,
                                          "name":name.text ,
                                          "dropvalue": selecteditem,
                                          "gender": selectedgender,
                                          "image": imageU,
                                          "birthday": x,
                                          "male": ny,
                                          "clothes":usa,
                                          "age":age.text,
                                          "govern":govern.text ,
                                          "healthy":healthy.text ,
                                          "job":job.text ,
                                          "mobile":mobile.text ,
                                          "userid":FirebaseAuth.instance.currentUser!.uid,
                                          "phone": phone.text,
                                          "qualify":qualify.text ,
                                        };
                                    // /*    SocialCubit.get(context).Adddatamale(model:mole(
                                    //       uid: uid.text,
                                    //       name:name.text ,
                                    //       dropvalue: selecteditem,
                                    //       gender: selectedgender,
                                    //       image: imageU,
                                    //       birthday: x,
                                    //       male: ny,
                                    //       clothes:usa,
                                    //       age:age.text,
                                    //       govern:govern.text ,
                                    //       healthy:healthy.text ,
                                    //       job:job.text ,
                                    //       mobile:mobile.text ,
                                    //       userid:FirebaseAuth.instance.currentUser!.uid,
                                    //       phone: phone.text,
                                    //       qualify:qualify.text ,
                                    //     ), gender: "male" , counter: (CachHelper.getData(key: "counter")
                                    //         ?? SocialCubit.get(context).counter ),).*/
                                    //    then((value) async{

                                          navigateTo(context, Female(m_name: name.text , m_uid: uid.text,m_data: m_data,));
        _clear();

                                   //     }
                                    //    );
                                    },
                                      child: const Text(
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
      Maleimage = null;
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
