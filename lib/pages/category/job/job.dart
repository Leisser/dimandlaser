import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mock_data/mock_data.dart';
import 'package:dimand/bottompages/first.dart';
import 'package:dimand/mydropdown.dart' as MyDropdown;
import 'package:dimand/pages/picloads/jobpic.dart';


class Jobb extends StatefulWidget {
  @override
  _DimpostState createState() => _DimpostState();
}

class _DimpostState extends State<Jobb> {
  @override
  Widget build(BuildContext context) => new Scaffold(
    resizeToAvoidBottomPadding: false,
    appBar: AppBar(
      leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){Navigator.pop(context);}),
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text('Satisfy Your Dimand'),
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
      cQuantity, cRequirement, cLocation, cDescribe, sex, cExperience, cRegion, cCareer, cType, cSalary;
  bool _load = false;
  String _bolt = '';
  String category = 'Jobs';
  String subcategory;

  _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2030)
    );
    if(picked != null) setState(() => _bolt = picked.toString());
  }

  checkMe() async {
    if (cName != null && cQuantity != null && cRequirement != null &&
        cLocation != null && cDescribe != null
        && cCareer != null && cRegion != null && cExperience != null && _bolt != null && cType != null && cSalary != null) {
      await prefs.setString('cName', cName);
      await prefs.setString('cDescribe', cDescribe);
      await prefs.setString('cQuantity', cQuantity);
      await prefs.setString('cLocation', cLocation);
      await prefs.setString('cRequirement', cRequirement);
      await prefs.setString('_bolt', _bolt);
      await prefs.setString('cRegion',cRegion);
      await prefs.setString('cCareer',cCareer);
      await prefs.setString('cExperience',cExperience);
      await prefs.setString('cType', cType);
      await prefs.setString('cSalary', cSalary);
      await pickOn();
    } else {
      Fluttertoast.showToast(msg: "FILL ALL FIELDS");
    }
  }



  Future<void> pickOn() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new JobPic()),
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
    subcategory = prefs.getString('dora') ?? '';
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
    if (cName != null && cQuantity != null && cRequirement != null &&
        cLocation != null && cDescribe != null
        && cCareer != null && cRegion != null && cExperience != null && _bolt != null && cType != null && cSalary != null) {
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
            'cLocation': cLocation,
            'cRequirement': cRequirement,
            'cLead': _bolt,
            'cExperience': cExperience,
            'cRegion': cRegion,
            'cCareer': cCareer,
            'cType': cType,
            'cSalary': cSalary,
            'category': category,
            'subcategory': subcategory,
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
    Widget plot () {
      if (cRegion == 'Central Region') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cLocation,
          items: <String>[
            'Kalangala','Kampala', 'Kayunga', 'Kiboga','Luwero', 'Masaka', 'Mpigi','Mubende','Mukono','Nakasongola','Sembabule','Wakiso']
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cLocation = newValue;
            });
          },
        );
      } else if (cRegion == 'Northern Region') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cLocation,
          items: <String>[
            'Adjumani','Apac','Arua', 'Gulu', 'Kitgum', 'Kotido','Lira','Moroto','Nakapiripirit','Nebbi','Yumbe']
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cLocation = newValue;
            });
          },
        );
      } else if (cRegion == 'Eastern Region') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cLocation,
          items: <String>[
            'Bugiri','Busia','Iganga','Jinja','Kaberamaindo','Kamuli','Kapchorwa','Katakwi','Kumi','Mayuge','Mbale', 'Palisa', 'Soroti', 'Tororo']
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cLocation = newValue;
            });
          },
        );
      } else if (cRegion == 'Western Region') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cLocation,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cLocation = newValue;
            });
          },
        );
      } else {
        return  null;
      }
    }

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
                          'Title',
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
                              hintText: 'Title',
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
                          'Job Type',
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black),
                        ),
                        margin: new EdgeInsets.only(
                            left: 10.0, bottom: 5.0, top: 10.0),
                        alignment: Alignment.bottomLeft,
                      ),
                      new Container(
                        child: new MyDropdown.DropdownButton(
                          hint: new Text('Select Type'),
                          value: cType,
                          items: <String>['Full-time', 'Part-time', 'Temporary', 'Contract', 'Internhip']
                              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
                            return MyDropdown.DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              cType = newValue;
                            });
                          },
                        ),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Divider(color: Colors.white,height: 20.0,),
                      new Container(
                        child: new Text(
                          'Minimum Experience',
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black),
                        ),
                        margin: new EdgeInsets.only(
                            left: 10.0, bottom: 5.0, top: 10.0),
                        alignment: Alignment.bottomLeft,
                      ),
                      new Container(
                        child: new MyDropdown.DropdownButton(
                          hint: new Text('Choose your Experience'),
                          value: cExperience,
                          items: <String>['less than 1 year', '1 year', '2 years', '3 years', '4 years', '5 years', 'more than 5 years']
                              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
                            return MyDropdown.DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              cExperience = newValue;
                            });
                          },
                        ),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Divider(color: Colors.white,height: 20.0,),
                      new Container(
                        child: new Text(
                          'Career Level',
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black),
                        ),
                        margin: new EdgeInsets.only(
                            left: 10.0, bottom: 5.0, top: 10.0),
                        alignment: Alignment.bottomLeft,
                      ),
                      new Container(
                        child: new MyDropdown.DropdownButton(
                          hint: new Text('Choose Career Level'),
                          value: cCareer,
                          items: <String>['Junior', 'Middle', 'Senior', 'Leadership']
                              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
                            return MyDropdown.DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              cCareer = newValue;
                            });
                          },
                        ),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Divider(color: Colors.white,height: 20.0,),
                      new Container(
                        child: new Text(
                          'Select Region',
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black),
                        ),
                        margin: new EdgeInsets.only(
                            left: 10.0, bottom: 5.0, top: 10.0),
                        alignment: Alignment.bottomLeft,
                      ),
                      new Container(
                        child: new MyDropdown.DropdownButton(
                          hint: new Text('Choose Your Region'),
                          value: cRegion,
                          items: <String>['Central Region', 'Eastern Region', 'Northern Region', 'Western Region']
                              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
                            return MyDropdown.DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              cRegion = newValue;
                            });
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
                              hintText: 'Describe what you want',
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
                          'Salary',
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black),
                        ),
                        margin: new EdgeInsets.only(
                            left: 10.0, bottom: 5.0, top: 10.0),
                        alignment: Alignment.bottomLeft,
                      ),
                      new Container(
                        child: new MyDropdown.DropdownButton(
                          hint: new Text('Choose Salary'),
                          value: cSalary,
                          items: <String>['Below USh500,000', 'USh500,000-800,000', 'USh800,000-1,000,000', 'USh1,000,000-1,500,000', 'USh1,500,000-2,000,000',
                          'USh2,000,000-2,500,000', 'USh2,500,000-3,000,000', 'USh3,000,000-5,000,000', 'USh5,000,000-10,000,000', 'Above USh10,000,000']
                              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
                            return MyDropdown.DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              cSalary = newValue;
                            });
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
                              hintText: 'Three',
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
                        child: plot(),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Divider(color: Colors.white,height: 20.0,),
                      new Container(
                        child: new Text(
                          'Preffered date/time of delivery or Starting work',
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black),
                        ),
                        margin: new EdgeInsets.only(
                            left: 10.0, bottom: 5.0, top: 10.0),
                        alignment: Alignment.bottomLeft,
                      ),
                      new Container(
                        padding: new EdgeInsets.all(5.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Text(_bolt, style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),),
                            new RaisedButton(onPressed: _selectDate, child: new Text('Click To Set Date',style: textstyle,),shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)
                            ), color: Colors.green, )
                          ],
                        ),
                      ),
                      new Container(
                        child: new Text(
                          'Minimum Requirements',
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
                              hintText: 'Summerize the requirements',
                              border: new UnderlineInputBorder(),
                              contentPadding: new EdgeInsets.all(5.0),
                              hintStyle: new TextStyle(color: Colors.grey)),
                          onChanged: (value) {
                            cRequirement = value;
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
