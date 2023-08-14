import 'package:abonaatomas/card/custom%20card%202.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Showchild extends StatefulWidget {
  const Showchild({Key? key,this.doc}) : super(key: key);
final doc;

  @override
  State<Showchild> createState() => _ShowchildState();
}

class _ShowchildState extends State<Showchild> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  FutureBuilder<QuerySnapshot<Object?>>(
        future: FirebaseFirestore.instance.collection('users').doc(widget.doc).collection('children').get(),
    builder: (context,snapshot) {
      if (snapshot.hasData) {
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, i) {
return customcard2(data: snapshot.data!.docs[i].data(),);
          },
        );
      }
      return Center(child: CircularProgressIndicator());
    },
      ),
    );
  }
}
