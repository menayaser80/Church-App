
import 'package:abonaatomas/dark%20mode/cashe%20helper.dart';
import 'package:abonaatomas/modules/Search.dart';
import 'package:abonaatomas/modules/children.dart';
import 'package:abonaatomas/modules/female.dart';
import 'package:abonaatomas/modules/male.dart';
import 'package:abonaatomas/reusable/colors.dart';
import 'package:abonaatomas/dark%20mode/cubit.dart';
import 'package:abonaatomas/modules/layout.dart';
import 'package:abonaatomas/reusable/reusable%20components.dart';
import 'package:abonaatomas/modules/search%20page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../church Cubit/bloc.dart';
import '../church Cubit/states.dart';

class Design extends StatefulWidget {

  Design({Key? key}) : super(key: key);

  @override
  State<Design> createState() => _DesignState();
}

class _DesignState extends State<Design> {
  var emailcontroller = TextEditingController();

  var formKey = GlobalKey<FormState>();
  int index = 0;
  var languages = [
    'اختر',
    'كنيسة العذراء مريم - كفر سليمان عوض',
    'كنيسة مارجرجس - ابى النجا',
    'كنيسة القديسة دميانة - طنطا',
    'كنيسة العذراء - الصاغة',
    'كنيسة الملاك ميخائيل طنطا',
    'كنيسة الملاك ميخائيل (الترعة)طنطا',
    'كنيسة ابى سيفين طنطا',
    'كنيسة الانبا كاراس والانبا انطونيوس - العجيزى',
    'كنيسة العذراء ومار جرجس الحمرة',
    'كنيسة مارمينا - طنطا',
    'كنيسة ماربولس طنطا',
    'كنيسة الملاك - سبرباى',
    'مارجرجس - برما',
    'مذبح - ميت السودان',
    'مذبح - ابو جمالة',
    'مذبح - صناديد',
    'مذبح - عزبة الملاوانى',
    'مذبح - كفر الشيخ سليم',
    'مذبح - ميت حبيش',
    'مذبح - الكرسا',
    'مذبح - دفرة',
    'مذبح - شونى',
    'مذبح - عزبة عطوان',
    'مذبح - فيشا سليم',
    'كنيسة مارجرجس - كفر الزيات',
    'كنيسة مارجرجس - اكوة',
    'مذبح الانبا بولا - الهلاوى',
    'مذبح الانبا بولا - النحارية',
    'مارجرجس - السنطة',
    'كنيسة ابى سيفين - مسهلة',
    'مذبح - بلكيم',
    'كنيسة السنطة البلد',
    'كنيسة مارمينا - بسيون',
    'كنيسة الملاك - صا الحجر',
    'كنيسة العذراء ابيار',
    'مذبح الانبا اثناسيوس - ابو الغر',
    'خدمة السجون'
  ];

  var selectedlang = "اختر";
  var people = [
    'السيد',
    'السيدة',
    'المرحوم',
    'المرحومة',
    'منفصل',
    'منفصلة',
    'مرتد',
    'مرتدة'
  ];
  var select = 'السيد';
  var govern = ['الغربية'];
  var idd = 'الغربية';
  var body = [
    'اختر',
    'المحلة الكبرى - حي أول',
    'المحلة الكبرى - حي ثاني',
    'طنطا - حي أول',
    'طنطا - حي ثاني',
    'سمنود',
    'قطور',
    'السنطة',
    'زفتى',
    'بسيون',
    'كفر الزيات'
  ];
  var ui = 'اختر';
  var family = [
    'اختر',
    'اخوة الرب',
    'اسرة مستترة',
    'اسرة مستقرة',
    'شعب الكنيسة'
  ];
  var fa = 'اختر';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Row(
          children: [
            IconButton(
              onPressed: () {
                AppCubit.get(context).changeappmode();
              },
              icon: const Icon(
                Icons.brightness_4_outlined,
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text('نوعية البحث',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),),
                    content: Container(
                      height: 250.0,
                      child:Column(
                        children: [
                        MaterialButton(onPressed: (){
                          navigateTo(context, loly(who: "m_name",))  ;

                        },child: Text('اسم الزوج'),),
                          MaterialButton(onPressed: (){
                            navigateTo(context, loly(who: "f_name",))  ;

                          },child: Text('اسم الزوجة'),),
                          MaterialButton(onPressed: (){
                            navigateTo(context, loly(who: "id",))  ;

                          },child: Text('المسلسل'),),
                          MaterialButton(onPressed: (){
                            navigateTo(context, loly(who: 'm_id',))  ;

                          },child: Text('الرقم القومي للزوج'),),
                          MaterialButton(onPressed: (){
                            navigateTo(context, loly(who: "f_id",))  ;

                          },child: Text('الرقم القومي للزوجة'),),

                        ],
                      ),
                    ),
                  );
                });
},
              icon: const Icon(
Icons.search,
              size: 18.0,),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Image(
                image: AssetImage(
                  'assets/images/ring.jpg',
                ),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.male,
                color: Colors.blue,
              ),
              title: const Text('بيانات الزوج'),
              onTap: () {
                setState((){
                  index=0;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.female,
                color: Colors.pinkAccent,
              ),
              title: const Text('بيانات الزوجة'),
              onTap: () {
                setState((){
                  index=1;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.child_care,
                color: Colors.indigo,
              ),
              title: const Text('بيانات الابناء'),
              onTap: () {
                setState((){
                  index=2;
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.description_outlined,
                color: Colors.green,
              ),
              title: const Text('قرارات'),
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: ClipRRect(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        borderRadius: BorderRadius.circular(30),
                        child: Material(
                          color: Colors.white.withOpacity(0.9),
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.85,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Form(
                                  key: formKey,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        height: 50,
                                        child: TextFormField(
                                            controller: emailcontroller,
                                            obscureText: true,
                                            validator: (v) {
                                              if (v.toString() != '123') {
                                                return 'try again';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.lock),
                                              fillColor: Color(0xfff0d8fa),
                                              filled: true,
                                              labelText: 'LocK',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                            ),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            onChanged: (value) {
                                              print(value);
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: () async {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0.r),
                                        color: const Color(0xffecf6ff),
                                      ),
                                      height: 40.0.h,
                                      width: 250.0.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MaterialButton(
                                            onPressed: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                navigateTo(context, Layout());
                                              }
                                            },
                                            child: Text(
                                              'دخول',
                                              style: TextStyle(
                                                fontSize: 15.0.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.accessibility_new_sharp,
                color: Colors.deepPurple,
              ),
              title: const Text('توزيعات عينية'),
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: ClipRRect(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        borderRadius: BorderRadius.circular(30),
                        child: Material(
                          color: Colors.white.withOpacity(0.9),
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.85,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Form(
                                  key: formKey,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        height: 50,
                                        child: TextFormField(
                                            controller: emailcontroller,
                                            obscureText: true,
                                            validator: (v) {
                                              if (v.toString() != '123') {
                                                return 'try again';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.lock),
                                              fillColor: Color(0xfff0d8fa),
                                              filled: true,
                                              labelText: 'LocK',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                            ),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            onChanged: (value) {
                                              print(value);
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: () async {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0.r),
                                        color: const Color(0xffecf6ff),
                                      ),
                                      height: 40.0.h,
                                      width: 250.0.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MaterialButton(
                                            onPressed: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                navigateTo(context, Layout());
                                              }
                                            },
                                            child: Text(
                                              'دخول',
                                              style: TextStyle(
                                                fontSize: 15.0.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.family_restroom_sharp,
                color: Colors.teal,
              ),
              title: const Text('الملابس'),
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: ClipRRect(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        borderRadius: BorderRadius.circular(30),
                        child: Material(
                          color: Colors.white.withOpacity(0.9),
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.85,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Form(
                                  key: formKey,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        height: 50,
                                        child: TextFormField(
                                            controller: emailcontroller,
                                            obscureText: true,
                                            validator: (v) {
                                              if (v.toString() != '123') {
                                                return 'try again';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.lock),
                                              fillColor: Color(0xfff0d8fa),
                                              filled: true,
                                              labelText: 'LocK',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                            ),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            onChanged: (value) {
                                              print(value);
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: () async {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0.r),
                                        color: const Color(0xffecf6ff),
                                      ),
                                      height: 40.0.h,
                                      width: 250.0.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MaterialButton(
                                            onPressed: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                navigateTo(context, Layout());
                                              }
                                            },
                                            child: Text(
                                              'دخول',
                                              style: TextStyle(
                                                fontSize: 15.0.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.report,
                color: Colors.blueGrey,
              ),
              title: const Text('تقارير'),
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: ClipRRect(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        borderRadius: BorderRadius.circular(30),
                        child: Material(
                          color: Colors.white.withOpacity(0.9),
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.85,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Form(
                                  key: formKey,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        height: 50,
                                        child: TextFormField(
                                            controller: emailcontroller,
                                            obscureText: true,
                                            validator: (v) {
                                              if (v.toString() != '123') {
                                                return 'try again';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.lock),
                                              fillColor: Color(0xfff0d8fa),
                                              filled: true,
                                              labelText: 'LocK',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                            ),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            onChanged: (value) {
                                              print(value);
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: () async {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0.r),
                                        color: const Color(0xffecf6ff),
                                      ),
                                      height: 40.0.h,
                                      width: 250.0.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MaterialButton(
                                            onPressed: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                navigateTo(context, Layout());
                                              }
                                            },
                                            child: Text(
                                              'دخول',
                                              style: TextStyle(
                                                fontSize: 15.0.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.yellow,
              ),
              title: const Text('اعدادات اساسية'),
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: ClipRRect(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        borderRadius: BorderRadius.circular(30),
                        child: Material(
                          color: Colors.white.withOpacity(0.9),
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.85,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Form(
                                  key: formKey,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        height: 50,
                                        child: TextFormField(
                                            controller: emailcontroller,
                                            obscureText: true,
                                            validator: (v) {
                                              if (v.toString() != '123') {
                                                return 'try again';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.lock),
                                              fillColor: Color(0xfff0d8fa),
                                              filled: true,
                                              labelText: 'LocK',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                            ),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            onChanged: (value) {
                                              print(value);
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: () async {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0.r),
                                        color: const Color(0xffecf6ff),
                                      ),
                                      height: 40.0.h,
                                      width: 250.0.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MaterialButton(
                                            onPressed: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                navigateTo(context, Layout());
                                              }
                                            },
                                            child: Text(
                                              'دخول',
                                              style: TextStyle(
                                                fontSize: 15.0.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.help,
                color: Colors.black,
              ),
              title: const Text('طلب مساعدة جديد'),
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                      child: ClipRRect(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        borderRadius: BorderRadius.circular(30),
                        child: Material(
                          color: Colors.white.withOpacity(0.9),
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.85,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Form(
                                  key: formKey,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        height: 50,
                                        child: TextFormField(
                                            controller: emailcontroller,
                                            obscureText: true,
                                            validator: (v) {
                                              if (v.toString() != '123') {
                                                return 'try again';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.lock),
                                              fillColor: Color(0xfff0d8fa),
                                              filled: true,
                                              labelText: 'LocK',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                            ),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            onChanged: (value) {
                                              print(value);
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: () async {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0.r),
                                        color: const Color(0xffecf6ff),
                                      ),
                                      height: 40.0.h,
                                      width: 250.0.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MaterialButton(
                                            onPressed: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                navigateTo(context, Layout());
                                              }
                                            },
                                            child: Text(
                                              'دخول',
                                              style: TextStyle(
                                                fontSize: 15.0.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: const Text('تسجيل الخروج'),
              onTap: () {
                navigateandFinish(context, Layout());
              },
            ),
          ],
        ),
      ),
      body: BlocProvider<SocialCubit>(
    create: (BuildContext context) => SocialCubit(),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        width: 70.0,
                        height: 25.0,
                        color: textColorActive, //#FAC090
                        child: TextFormField()),
                    SizedBox(
                      width: 3.0,
                    ),
                    Container(
                      height: 25.0,
                      width: 100,
                      color: mainColor,
                      child: Center(
                        child: Text(
                          'سانت موسي',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Container(
                        width: 70.0,
                        height: 25.0,
                        color: textColorActive,
                        child: TextFormField()),
                    SizedBox(
                      width: 3.0,
                    ),
                    Container(
                      height: 25.0,
                      width: 80,
                      color: mainColor,
                      child: Center(
                        child: Text(
                          'كود البابا',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Container(
                        width: 70.0,
                        height: 25.0,
                        color: textColorActive,
                        child: TextFormField()),
                    SizedBox(
                      width: 3.0,
                    ),
                    Container(
                      height: 25.0,
                      width: 70,
                      color: mainColor,
                      child: Center(
                        child: Text(
                          'الارشيف',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Container(
                        width: 70.0,
                        height: 25.0,
                        color: textColorActive,
                        child: TextFormField()),
                    SizedBox(
                      width: 3.0,
                    ),
                    Container(
                      height: 25.0,
                      width: 60,
                      color: mainColor,
                      child: Center(
                        child: Text(
                          'فيرينا',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Container(
                        width: 70.0,
                        height: 25.0,
                        color: textColorActive,
                        child: TextFormField()),
                    SizedBox(
                      width: 3.0,
                    ),
                    Container(
                      height: 25.0,
                      width: 60,
                      color: mainColor,
                      child: Center(
                        child: Text(
                          'الرعاية',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    BlocBuilder<SocialCubit , SocialStates>(
                     builder : (context, state) => Container(
                          width: 70.0,
                          height: 25.0,
                          color: textColorActive,
                          child:Text('${(CachHelper.getData(key: "counter") ?? SocialCubit.get(context).counter ) } '),),
                    ),
                    SizedBox(
                      width: 3.0,
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
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        width: 70.0,
                        height: 25.0,
                        color: textColorActive,
                        child: TextFormField()),
                    SizedBox(
                      width: 3.0,
                    ),
                    Container(
                      height: 25.0,
                      width: 120,
                      color: mainColor,
                      child: Center(
                        child: Text(
                          ' عدد اسر موسي ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Container(
                        width: 70.0,
                        height: 25.0,
                        color: textColorActive,
                        child: TextFormField()),
                    SizedBox(
                      width: 3.0,
                    ),
                    Container(
                      height: 25.0,
                      width: 140,
                      color: mainColor,
                      child: Center(
                        child: Text(
                          'عدد اسر الارشيف',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Container(
                        width: 70.0,
                        height: 25.0,
                        color: textColorActive,
                        child: TextFormField()),
                    SizedBox(
                      width: 3.0,
                    ),
                    Container(
                      height: 25.0,
                      width: 100,
                      color: mainColor,
                      child: Center(
                        child: Text(
                          'عدد اسر البابا',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Container(
                        width: 70.0,
                        height: 25.0,
                        color: textColorActive,
                        child: TextFormField()),
                    SizedBox(
                      width: 3.0,
                    ),
                    Container(
                      height: 25.0,
                      width: 110,
                      color: mainColor,
                      child: Center(
                        child: Text(
                          'عدد اسر فيرينا',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Container(
                        width: 70.0,
                        height: 25.0,
                        color: textColorActive,
                        child: TextFormField()),
                    SizedBox(
                      width: 3.0,
                    ),
                    Container(
                      height: 25.0,
                      width: 110,
                      color: mainColor,
                      child: Center(
                        child: Text(
                          'عدد اسر البرنامج',
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
              ),
              Container(
                color: Colors.grey[200],
                width: double.infinity,
                child: DropdownButton<String>(
                  items: languages.map((String item) {
                    return DropdownMenuItem<String>(
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
                      selectedlang = thelang!;
                    });
                  },
                  value: selectedlang,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      width: 180.0,
                      height: 45.0,
                      color: textColorActive,
                      child: TextFormField()),
                  SizedBox(
                    width: 5.0,
                  ),
                  Container(
                    color: Colors.white,
                    child: DropdownButton<String>(
                      items: people.map((String item) {
                        return DropdownMenuItem<String>(
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
                          select = thelang!;
                        });
                      },
                      value: select,
                    ),
                  ),
                  SizedBox(
                    width: 3.0,
                  ),
                  Container(
                    height: 50.0,
                    width: 90,
                    color: itemColor,
                    child: Center(
                      child: Text(
                        'رب الاسرة',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Container(
                        width: 190.0,
                        height: 35.0,
                        color: textColorActive,
                        child: TextFormField()),
                    SizedBox(
                      width: 5.0,
                    ),
                    Container(
                      height: 35.0,
                      width: 100,
                      color: itemColor,
                      child: Center(
                        child: Text(
                          'الزوجة',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        width: 180.0,
                        height: 45.0,
                        color: textColorActive,
                        child: TextFormField()),
                    Container(
                      height: 50.0,
                      width: 110,
                      color: lightColor,
                      child: Center(
                        child: Text(
                          'باقي العنوان ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 0.5,
                    ),
                    Container(
                      height: 50.0,
                      width: 205,
                      color: Colors.white,
                      child: DropdownButton<String>(
                        items: body.map((String item) {
                          return DropdownMenuItem<String>(
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
                            ui = thelang!;
                          });
                        },
                        value: ui,
                      ),
                    ),
                    SizedBox(
                      width: 0.5,
                    ),
                    Container(
                      height: 50.0,
                      width: 90,
                      color: lightColor,
                      child: Center(
                        child: Text(
                          'المركز',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 0.5,
                    ),
                    Container(
                      color: Colors.white,
                      child: DropdownButton<String>(
                        items: govern.map((String item) {
                          return DropdownMenuItem<String>(
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
                            idd = thelang!;
                          });
                        },
                        value: idd,
                      ),
                    ),
                    Container(
                      height: 50.0,
                      width: 90,
                      color: lightColor,
                      child: Center(
                        child: Text(
                          'المحافظة',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 140.0,
                        color: Colors.grey[100],
                        child: DropdownButton<String>(
                          items: family.map((String item) {
                            return DropdownMenuItem<String>(
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
                              fa = thelang!;
                            });
                          },
                          value: fa,
                        ),
                      ),
                      Text(
                        'تصنيف الاسرة',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              child: Container(
                                width: 25,
                                height: 40,
                                color: Colors.grey[100],
                                child: Center(
                                  child: Text(
                                    '0',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 115,
                              height: 40,
                              color: lightColor,
                              child: Center(
                                child: Text(
                                  'افراد الاسرة كساء',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 6),
                              child: Container(
                                width: 25,
                                height: 40,
                                color: Colors.grey[100],
                                child: Center(
                                  child: Text(
                                    '0',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 115,
                              height: 40,
                              color: lightColor,
                              child: Center(
                                child: Text(
                                  'افراد الاسرة غذاء',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          color: mainColor,
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                setState((){
                                  index--;
                                });
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 0.9,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          color: mainColor,
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                setState((){
                                  index++;
                                });
                              },
                              icon: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 300,padding: EdgeInsets.symmetric(vertical: 12,horizontal: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red)
                    ),
                    child: IndexedStack(
                      index: index,
                      children: [
                        Male(),
                        Female(),
                        Childrens(),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      leading: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Image(
                image: AssetImage('assets/images/ring.jpg'),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.male,
                color: Colors.blue,
              ),
              title: const Text('بيانات الزوج'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.female,
                color: Colors.pinkAccent,
              ),
              title: const Text('بيانات الزوجة'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.child_care,
                color: Colors.indigo,
              ),
              title: const Text('بيانات الابناء'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.description_outlined,
                color: Colors.green,
              ),
              title: const Text('قرارات'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.accessibility_new_sharp,
                color: Colors.deepPurple,
              ),
              title: const Text('توزيعات عينية'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.family_restroom_sharp,
                color: Colors.teal,
              ),
              title: const Text('الملابس'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.report,
                color: Colors.blueGrey,
              ),
              title: const Text('تقارير'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.yellow,
              ),
              title: const Text('اعدادات اساسية'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.help,
                color: Colors.black,
              ),
              title: const Text('طلب مساعدة جديد'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: const Text('تسجيل الخروج'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
