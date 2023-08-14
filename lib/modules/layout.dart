import 'package:abonaatomas/Login/social%20login.dart';
import 'package:abonaatomas/reusable/reusable%20components.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  var languages = ['القس توماس توفيق'];

  var selectedlang = "القس توماس توفيق";
  var idController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage('assets/images/church.jpg'),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(
            width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80.0,
                ),
                DropdownButton<String>(
                  items: languages.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 18.0,),
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
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      controller: idController,
                      obscureText: true,
                      validator: (v) {
                        if (v.toString() != '0000') {
                          return 'try again';
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  width: 140.0,
                  color: Colors.green,
                  child: MaterialButton(onPressed: () {
              if(formKey.currentState!.validate())
                {
                  navigateTo(context, ChatLogin());
                }
                  },child: Text('دخول البرنامج',style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
