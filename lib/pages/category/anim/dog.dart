import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mock_data/mock_data.dart';
import 'package:dimand/bottompages/first.dart';
import 'package:dimand/mydropdown.dart' as MyDropdown;
import 'package:dimand/pages/picloads/dogpic.dart';


class Dogs extends StatefulWidget {
  @override
  _DimpostState createState() => _DimpostState();
}

class _DimpostState extends State<Dogs> {
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
      cQuantity, cPrice, cLocation, cDescribe, sex, cGender, cRegion, cNegotiate, cBreed, cAge;
  bool _load = false;
  String _bolt = '';
  String category = 'Animals & Pets';
  String subcategory = 'Dogs & Puppies';

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
    if (cName != null && cQuantity != null && cPrice != null &&
        cLocation != null && cDescribe != null
        && cNegotiate != null && cRegion != null && cGender != null && _bolt != null && cBreed != null && cAge != null) {
      await prefs.setString('cName', cName);
      await prefs.setString('cDescribe', cDescribe);
      await prefs.setString('cQuantity', cQuantity);
      await prefs.setString('cLocation', cLocation);
      await prefs.setString('cPrice', cPrice);
      await prefs.setString('_bolt', _bolt);
      await prefs.setString('cRegion',cRegion);
      await prefs.setString('cNegotiate',cNegotiate);
      await prefs.setString('cGender',cGender);
      await prefs.setString('cBreed', cBreed);
      await prefs.setString('cAge', cAge);
      await pickOn();
    } else {
      Fluttertoast.showToast(msg: "FILL ALL FIELDS");
    }
  }



  Future<void> pickOn() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new DogPic()),
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
        cLocation != null && cDescribe != null
        && cNegotiate != null && cRegion != null && cGender != null && _bolt != null && cBreed != null && cAge != null) {
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
            'cPrice': cPrice,
            'cLead': _bolt,
            'cGender': cGender,
            'cRegion': cRegion,
            'cNegotiate': cNegotiate,
            'cBreed': cBreed,
            'cAge': cAge,
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
                          'Name',
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
                          'Type',
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
                          value: cBreed,
                          items: <String>['Mongrel(No Breed)', 'affenpinscher', 'Afghan hound', 'Airedale terrier', 'Akita', 'Alaskan Malamute',
                            'American Staffordshire terrier', 'American water spaniel', 'Australian cattle dog', 'Australian shepherd',
                            'Australian terrier', 'basenji', 'basset hound', 'beagle', 'bearded collie', 'Bedlington terrier', 'Bernese mountain dog',
                            'bichon frise', 'black and tan coonhound', 'bloodhound', 'border collie', 'border terrier', 'borzoi', 'Boston terrier',
                            'bouvier des Flandres', 'boxer', 'briard', 'Brittany', 'Brussels griffon', 'bull terrier', 'bulldog', 'bullmastiff',
                            'cairn terrier', 'Canaan dog', 'Chesapeake Bay retriever', 'Chihuahua', 'Chinese crested', 'Chinese shar-pei', 'chow chow',
                            'Clumber spaniel', 'cocker spaniel', 'collie', 'curly-coated retriever', 'dachshund', 'Dalmatian', 'Doberman pinscher',
                            'English cocker spaniel', 'English setter', 'English springer spaniel', 'English toy spaniel', 'Eskimo dog', 'Finnish spitz',
                            'flat-coated retriever', 'fox terrier', 'foxhound', 'French bulldog', 'German shepherd', 'German shorthaired pointer',
                            'German wirehaired pointer', 'golden retriever', 'Gordon ', 'Great Dane', 'greyhound', 'Irish setter', 'Irish water spaniel',
                            'Irish wolfhound', 'Jack Russell terrier', 'Japanese spaniel', 'keeshond', 'Kerry blue terrier', 'komondor', 'kuvasz', 'Labrador retriever',
                            'Lakeland terrier', 'Lhasa apso', 'Maltese', 'Manchester terrier', 'mastiff', 'Mexican hairless', 'Newfoundland', 'Norwegian elkhound',
                            'Norwich terrier', 'otterhound', 'papillon', 'Pekingese', 'pointer', 'Pomeranian', 'poodle', 'pug', 'puli', 'Rhodesian ridgeback', 'Rottweiler',
                            'Saint Bernard', 'saluki', 'Samoyed', 'schipperke', 'schnauzer', 'Scottish deerhound', 'Scottish terrier', 'Sealyham terrier', 'Shetland sheepdog',
                            'shih tzu', 'Siberian husky', 'silky terrier', 'Skye terrier', 'Staffordshire bull terrier', 'soft-coated wheaten terrier',
                            'Sussex spaniel', 'spitz', 'Tibetan terrier', 'vizsla', 'Weimaraner', 'Welsh terrier', 'West Highland white terrier', 'whippet',
                          'Yorkshire terrier', 'Other']
                              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
                            return MyDropdown.DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              cBreed = newValue;
                            });
                          },
                        ),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Divider(color: Colors.white,height: 20.0,),
                      new Container(
                        child: new Text(
                          'Gender',
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
                          hint: new Text('Choose the Gender'),
                          value: cGender,
                          items: <String>['Female', 'Male']
                              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
                            return MyDropdown.DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              cGender = newValue;
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
                          'Age',
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
                          hint: new Text('Choose the Age'),
                          value: cAge,
                          items: <String>['Adult', 'Baby', 'Senior', 'Young']
                              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
                            return MyDropdown.DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              cAge = newValue;
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
                          'Preffered Price',
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
                              hintText: '250000 (Shillings Only)',
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
                        child: new Text(
                          'Negotiable',
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
                          hint: new Text('Are You Price Flexible'),
                          value: cNegotiate,
                          items: <String>['Negotiable', 'Nonnegotiable']
                              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
                            return MyDropdown.DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              cNegotiate = newValue;
                            });
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
