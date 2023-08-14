import 'package:abonaatomas/church%20Cubit/bloc.dart';
import 'package:abonaatomas/modules/animation.dart';
import 'package:abonaatomas/dark%20mode/cashe%20helper.dart';
import 'package:abonaatomas/dark%20mode/cubit.dart';
import 'package:abonaatomas/dark%20mode/dio%20helper.dart';
import 'package:abonaatomas/dark%20mode/states.dart';
import 'package:abonaatomas/reusable/reusable%20components.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CachHelper.init();
  DioHelper.init();
  bool? isdark = CachHelper.getBoolean(key: 'isdark');
  uid= CachHelper.getData(key: 'uid') ?? '';
  // CachHelper.removeData(key: "counter");
  runApp(MyApp(isdark));
}
class MyApp extends StatelessWidget {
  final bool? isdark;
  MyApp(this.isdark);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:(context,child) => MultiBlocProvider(
        providers: [
          BlocProvider(create:  (BuildContext context)=>AppCubit()..changeappmode(fromshared:isdark,
          ),),
          BlocProvider(create:  (BuildContext context)=>SocialCubit()..getUserData()),
        ],
        child: BlocConsumer<AppCubit,NewsStates>(
          listener: (context,state){},
          builder: (context,state){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch:Colors.deepOrange,
                scaffoldBackgroundColor:Colors.white,
                appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness:Brightness.dark,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor:Colors.grey,
                  elevation: 20.0,
                  backgroundColor: Colors.white,
                ),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange,
                ),
              ),
              darkTheme: ThemeData(
                primarySwatch:Colors.deepOrange,
                scaffoldBackgroundColor: HexColor('333739'),
                appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor:HexColor('333739'),
                    statusBarIconBrightness:Brightness.light,
                  ),
                  backgroundColor:HexColor('333739'),
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor:Colors.grey,
                  elevation: 20.0,
                  backgroundColor: HexColor('333739'),
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange,
                ),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              themeMode:AppCubit.get(context).isdark?ThemeMode.dark:ThemeMode.light,
              home:Directionality(
                  textDirection: TextDirection.rtl,
                  child: animation()),
            );
          },
        ),
      ),
    );
  }
}



