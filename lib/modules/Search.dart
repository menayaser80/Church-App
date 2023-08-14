// import 'package:abonaatomas/church%20Cubit/states.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../church Cubit/bloc.dart';
//
// class FirebaseSearchScreen extends StatefulWidget {
//   const FirebaseSearchScreen({Key? key}) : super(key: key);
//
//   @override
//   State<FirebaseSearchScreen> createState() => _FirebaseSearchScreenState();
// }
//
// class _FirebaseSearchScreenState extends State<FirebaseSearchScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   @override
//   void initState() {
//     BlocProvider.of<SocialCubit>(context).getUserData();
//     super.initState();
//     _searchController.addListener(() {
//       setState((){});
//     });
//   }
//   List searchResult = [];
//
//   void searchFromFirebase(String query) async {
//     final result = await FirebaseFirestore.instance
//         .collection('users')
//         .where('uid', isEqualTo: query)
//         .get();
//     setState(() {
//       searchResult = result.docs.map((e) => e.data()).toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context)  {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("بحث"),
//       ),
//       body: BlocBuilder<SocialCubit , SocialStates>(
//         builder:(context, state) {
//             //searchFromFirebase(_searchController.text);
//       if(state is SocialGetUserErrorState){
//         print("Error happened ${state.error.toString()}");
//       }
//           if(state is SocialGetUserSuccessState){
//             print("///////////////////////////////${SocialCubit.get(context).searchhResult!.name}");
//             return Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(15.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: "Search Here",
//                     ),
//                     // onChanged: (query){
//                     //   searchFromFirebase(query);
//                     // },
//                   ),
//                 ),
//                 Expanded(
//                   child: BlocBuilder<SocialCubit , SocialStates>(
//                     builder:(context, state) {
//                       return ListView.builder(
//                       itemCount: searchResult.length,
//                       itemBuilder: (context, index) {
//
//                         print("******************************${searchResult[index]}");
//                         print("///////////////////////////////${SocialCubit.get(context).searchhResult!.name}");
//                         return ListTile(
//
//                           title: Text("${SocialCubit.get(context).userModel!.name}"),
//                           //subtitle: Text(searchResult[index]['string_id']),
//                         );
//                       },
//                     );
//                     },
//                   ),
//                 ),
//               ],
//             );
//           }
//           return CircularProgressIndicator();
//
//
//         },
//       ),
//     );
//   }
// }