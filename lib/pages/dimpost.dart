import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dimand/pages/pick.dart';
import 'package:mock_data/mock_data.dart';
import 'package:dimand/bottompages/first.dart';


class Dimpost extends StatefulWidget {
  @override
  _DimpostState createState() => _DimpostState();
}

class _DimpostState extends State<Dimpost> {
  @override
  Widget build(BuildContext context) => new Scaffold(
    resizeToAvoidBottomPadding: false,
    appBar: AppBar(
      leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){Navigator.pop(context);}),
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text('Post Your Demand'),
    ),
    body: new DimPostScreen(),
  );
}

class DimPostScreen extends StatefulWidget{
  DimPostScreen({Key key,}) : super(key: key);

  State createState() => new DimPostScreenState();

}

class DimPostScreenState extends State<DimPostScreen> {
  SharedPreferences prefs;
  String cName, id, photoUrl, nickName, country, phoneNumber, address,
      cQuantity, cPrice, cLocation, cLead, cDescribe, sex;
  bool _load = false;

    checkMe() async {
      if (cName != null && cQuantity != null && cPrice != null &&
          cLocation != null && cLead != null && cDescribe != null) {
      await prefs.setString('cName', cName);
      await prefs.setString('cDescribe', cDescribe);
      await prefs.setString('cQuantity', cQuantity);
      await prefs.setString('cLead', cLead);
      await prefs.setString('cLocation', cLocation);
      await prefs.setString('cPrice', cPrice);
        await pickOn();
      } else {
        Fluttertoast.showToast(msg: "FILL ALL FIELDS");
      }
    }



  Future<void> pickOn() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new PickOn()),
    );

  }

  Future<void> readLocal() async {
    prefs = await SharedPreferences.getInstance();
    id = prefs.getString('id') ?? '';
    nickName = prefs.getString('nickname') ?? '';
    photoUrl = prefs.getString('photoUrl') ?? '';
    address = prefs.getString('address') ?? '';
    phoneNumber = prefs.getString('phoneNumber') ?? '';
    country = prefs.getString('country') ?? '';
    sex = prefs.getString('sex') ?? '';


    // Force refresh input
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    readLocal();
  }

  final TextStyle textstyle =
  TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  final InputDecoration decoration = InputDecoration(
    border: OutlineInputBorder(),
  );

  void handleUpdateDim() {
    setState((){
      _load = true;
    });
    if (cName != null && cQuantity != null && cPrice != null &&
        cLocation != null && cLead != null && cDescribe != null) {
      String docName;
      docName = mockString(50);

      Firestore.instance.collection('dimandPosts').document(docName).setData(
          {
            'id': id,
            'photoUrl': photoUrl,
            'nickname': nickName,
            'country': country,
            'address': address,
            'phoneNumber': phoneNumber,
            'sex': sex,
            'cName': cName,
            'cDescribe': cDescribe,
            'cQuantity': cQuantity,
            'cLead': cLead,
            'cLocation': cLocation,
            'cPrice': cPrice,
            'timestamp': DateTime.now().millisecondsSinceEpoch,
          });
      dim();
        Fluttertoast.showToast(msg: "Update success");

    }else {
      Fluttertoast.showToast(msg: "FILL ALL FIELDS");
    }
  }

  dim(){
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => PageOne()),
          (Route<dynamic> route) => false,
    );

  }


  @override
  Widget build(BuildContext context) {
    Widget loadingIndicator =_load? new Container(
      color: Colors.orange[300],
      width: 70.0,
      height: 70.0,
      child: new Padding(padding: const EdgeInsets.all(5.0),child: new Center(child: new CircularProgressIndicator())),
    ):new Container();

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(

              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    verticalDirection: VerticalDirection.down,


                    children: <Widget>[
                      new Align(child: loadingIndicator,alignment: FractionalOffset.center,),
                      new Container(
                        child: new Text(
                          'Product/Service name',
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black),
                        ),
                        margin: new EdgeInsets.only(
                            left: 10.0, bottom: 5.0, top: 10.0),
                        alignment: Alignment.bottomLeft,
                      ),
                      new Container(
                        child: new TextField(
                          decoration: new InputDecoration(
                              hintText: 'Phone',
                              border: new UnderlineInputBorder(),
                              contentPadding: new EdgeInsets.all(5.0),
                              hintStyle: new TextStyle(color: Colors.grey)),
                          onChanged: (value) {
                            cName = value;
                          },
                        ),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Divider(color: Colors.white,height: 20.0,),
                      new Container(
                        child: new Text(
                          'Dercription',
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black),
                        ),
                        margin: new EdgeInsets.only(
                            left: 10.0, bottom: 5.0, top: 10.0),
                        alignment: Alignment.bottomLeft,
                      ),
                      new Container(
                        child: new TextField(
                          decoration: new InputDecoration(
                              hintText: 'Black, Android 8, HD camera etc.',
                              border: new UnderlineInputBorder(),
                              contentPadding: new EdgeInsets.all(5.0),
                              hintStyle: new TextStyle(color: Colors.grey)),
                          onChanged: (value) {
                            cDescribe = value;
                          },
                        ),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Divider(color: Colors.white,height: 20.0,),
                      new Container(
                        child: new Text(
                          'Quantity',
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black),
                        ),
                        margin: new EdgeInsets.only(
                            left: 10.0, bottom: 5.0, top: 10.0),
                        alignment: Alignment.bottomLeft,
                      ),
                      new Container(
                        child: new TextField(
                          decoration: new InputDecoration(
                              hintText: '3 pieces',
                              border: new UnderlineInputBorder(),
                              contentPadding: new EdgeInsets.all(5.0),
                              hintStyle: new TextStyle(color: Colors.grey)),
                          onChanged: (value) {
                            cQuantity = value;
                          },
                        ),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Divider(color: Colors.white,height: 20.0,),
                      new Container(
                        child: new Text(
                          'Your location',
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black),
                        ),
                        margin: new EdgeInsets.only(
                            left: 10.0, bottom: 5.0, top: 10.0),
                        alignment: Alignment.bottomLeft,
                      ),
                      new Container(
                        child: new TextField(
                          decoration: new InputDecoration(
                              hintText: 'Kampala',
                              border: new UnderlineInputBorder(),
                              contentPadding: new EdgeInsets.all(5.0),
                              hintStyle: new TextStyle(color: Colors.grey)),
                          onChanged: (value) {
                            cLocation = value;
                          },
                        ),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Divider(color: Colors.white,height: 20.0,),
                      new Container(
                        child: new Text(
                          'Preffered date/time of delivery or pickup',
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black),
                        ),
                        margin: new EdgeInsets.only(
                            left: 10.0, bottom: 5.0, top: 10.0),
                        alignment: Alignment.bottomLeft,
                      ),
                      new Container(
                        child: new TextField(
                          decoration: new InputDecoration(
                              hintText: 'Today before 3:00pm',
                              border: new UnderlineInputBorder(),
                              contentPadding: new EdgeInsets.all(5.0),
                              hintStyle: new TextStyle(color: Colors.grey)),
                          onChanged: (value) {
                            cLead = value;
                          },
                        ),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Divider(color: Colors.white,height: 20.0,),
                      new Container(
                        child: new Text(
                          'Price your willing to pay for the item/service (shs)',
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black),
                        ),
                        margin: new EdgeInsets.only(
                            left: 10.0, bottom: 5.0, top: 10.0),
                        alignment: Alignment.bottomLeft,
                      ),
                      new Container(
                        child: new TextField(
                          decoration: new InputDecoration(
                              hintText: '250000',
                              border: new UnderlineInputBorder(),
                              contentPadding: new EdgeInsets.all(5.0),
                              hintStyle: new TextStyle(color: Colors.grey)),
                          onChanged: (value) {
                            cPrice = value;
                          },
                        ),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Divider(color: Colors.white,height: 20.0,),

                        new Container(
                          margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: <Widget>[
                              new Container(
                                child: RaisedButton(
                                  color: Colors.green,
                                  child: Text("ADD IMAGES", style: textstyle,),
                                  onPressed: checkMe,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(30.0)
                                  ),
                                ),

                              ),
                              new Container(
                                child: RaisedButton(
                                  color: Colors.orange,
                                  child: Text("UPLOAD POST", style: textstyle,),
                                  onPressed: handleUpdateDim,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(30.0)
                                  ),
                                ),

                              ),
                            ],
                          ),

                        ),

                    ],
                  )
              )
          );
        }
    );
  }

}
