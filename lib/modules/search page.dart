import 'package:abonaatomas/modules/show.dart';
import 'package:abonaatomas/reusable/reusable%20components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ser {
  var id ;
  var name;
  ser({ this.id , this.name});
}
class loly extends StatefulWidget {
  loly({Key? key,this.who}) : super(key: key);
final who ;
  @override
  State<loly> createState() => _lolyState();
}

class _lolyState extends State<loly> {
  CollectionReference montajat = FirebaseFirestore.instance.collection("users");
  TextEditingController clear = new TextEditingController();
  List<ser> serlist = [


  ];


  var gta = [];
  var vgta ;
  var gta2 =[];
  var fas =[];
  var noor = [];
  gtarun()async{

    await montajat.get().then((value) => value.docs.forEach((element) {

      fas.add(element.data());

    }));

    for (var i = 0; i < fas.length; i++) {
      setState(() {

        serlist.addAll([

          ser(
              name : fas[i][widget.who] ,
              id :fas[i]["id"] ,

          )

        ]);
      });
    }


    Iterable<ser> nameget = serlist;
    gta2 = nameget.toList();
    nameget.forEach((element) => gta.add(element.id));

  }




  @override
  void initState() {
    gtarun();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Container(

            child: Column(children: [
              ///////////////////////////////////////////////////////////////////////////////////
              Container(
                decoration: BoxDecoration(
                    color: Color(0xff4B8B00),// Your desired background color

                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 15),
                    ]
                ),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 40, left: 10 , right: 10
                        , bottom: 20),

                    child:

                    Row(children: [
                      Directionality(
                        // add this
                          textDirection: TextDirection.rtl, // set this property
                          child: IconButton(onPressed: (){ clear.clear();
                          setState(() {
                            gta2.clear();
                            gta.clear();
                            Iterable<ser> nameget = serlist;
                            gta2 = nameget.toList();
                            nameget.forEach((element) => gta.add(element.id));

                          });

                          }, icon: Icon(Icons.close,color : Color(0xffffffff)),)),
                      Expanded(
                        child: Container(

                          child: Directionality(
                            // add this
                            textDirection: TextDirection.rtl, // set this property
                            child:Container(
                              color: Color(0xff4B8B00),
                              child: TextFormField(

                                controller: clear,
                                onChanged: (value) {
                                  setState(() {
                                    Iterable<ser> nameget = serlist.where((element) => element.name.contains(value));
                                    gta2 = nameget.toList();
                                    print(gta2.toString());
                                    gta.clear();
                                    nameget.forEach((element) => gta.add(element.id));


                                  });

                                },
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                ),
                                keyboardType:
                                TextInputType.emailAddress,
                                maxLines: 1,
                                cursorColor: Color(0xffffffff),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffffffff),
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(20),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffffffff),
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(20),
                                    ),
                                    labelText: " بحث",
                                    labelStyle: TextStyle(
                                      color: Color(0xffffffff),
                                      fontFamily: "Neckar",
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Directionality(
                        // add this
                          textDirection: TextDirection.rtl, // set this property
                          child: IconButton(onPressed: (){
                          Navigator.pop(context);
                            }, icon: Icon(Icons.arrow_back,color : Color(0xffffffff)),)),

                    ],),


                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////



                  ),
                ),
              ),
              //////////////////////////////////////////////////////////////////////////////////
              Expanded(child: ListView.builder(
                  itemCount: gta2.length,

                  itemBuilder: (context , i){
                    return
                      Container(
                        margin :EdgeInsets.only(top: 15 ,),
                        decoration: BoxDecoration(
                            color: Color(0xffffffff), // Your desired background color
                            // borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 15),
                            ]
                        ),
                        child:   ListTile(

                          onTap: ()async {



                         //   showloding(context);

                            var temp = await montajat.doc(gta[i].toString()).get();
                          navigateTo(context, Show(id: gta[i].toString()
                          ,
                            m_data: temp["m_data"],
                            f_data:  temp["f_data"],
                             f_id:  temp["f_id"],
                            f_name:  temp["f_name"],
                            m_id:  temp["m_id"],
                            m_name:  temp["m_name"],





                          ));

                         //   Get.back();
                    /*        Get.to(show(),arguments:[ {
                              "photo":  temp["photo"],
                              "wasef":  temp["wasef"],
                              "cash":  temp["cash"],
                              "name": temp["name"],
                              "id":  temp["id"],
                              "uid": temp["uid"],
                              // "name":  snapshot.data.docs[i].data()["name"],
                            }]);*/

                          },
                          trailing: Icon(Icons.search,color : Color(0xff4B8B00)),
                          title: Container(
                            margin :EdgeInsets.only( left: 20, right: 20),
                            child: Text(gta2[i].name.toString(),textDirection: TextDirection.rtl,
                              style: TextStyle(color: Color(0xff4B8B00), fontFamily: "cairo",

                                  fontSize:15,

                                  fontWeight: FontWeight.bold),),

                          ),

                        ),
                      );

                  }





              ))

            ] ) ) ,
      );


  }
}

List bb = [
  {"name" : "ahmad" , "id" : "12344"},
  {"name" : "omer" , "id" : "35499"},
  {"name" : "osman" , "id" : "25499"},

];
