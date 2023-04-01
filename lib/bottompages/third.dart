import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dimand/pages/pick.dart';

class PageThree extends StatefulWidget{
  PageThree({Key key,}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree>{
  SharedPreferences prefs;
  String cName, id, photoUrl, nickName, country, phoneNumber, address,
      cQuantity, cPrice, cLocation, cLead, cDescribe;

  Future<void> checkMe() async {
    if (cName != null && cQuantity != null && cPrice != null &&
        cLocation != null && cLead != null && cDescribe != null) {
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

  @override
  Widget build(BuildContext context) {
    return  Scaffold (
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){Navigator.pop(context);}),
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text('Post Your Demand'),
      ),
      body: Container(
        height: 900,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,

              children: <Widget>[
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
                        hintText: 'Black, Android 8, HD camera etc.',
                        border: new UnderlineInputBorder(),
                        contentPadding: new EdgeInsets.all(5.0),
                        hintStyle: new TextStyle(color: Colors.grey)),
                    onChanged: (value) {
                      cQuantity = value;
                    },
                  ),
                  margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                ),
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

                RaisedButton(
                  color: Colors.blue,
                  child: Text("Pick images", style: textstyle,),
                  onPressed: checkMe,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

