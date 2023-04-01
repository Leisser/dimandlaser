import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mock_data/mock_data.dart';
import 'package:dimand/bottompages/first.dart';
import 'package:dimand/mydropdown.dart' as MyDropdown;
import 'package:dimand/pages/picloads/shoespic.dart';


class Shoe extends StatefulWidget {
  @override
  _DimpostState createState() => _DimpostState();
}

class _DimpostState extends State<Shoe> {
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
      cQuantity, cPrice, cLocation, cDescribe, sex, cGender, cRegion, cNegotiate, cBrand, cMaterial, cColor, cType, cFastening, cStyle;
  bool _load = false;
  String _bolt = '';
  String category = 'Fashion';
  String subcategory = 'Shoes';

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
        && cNegotiate != null && cRegion != null && cGender != null && _bolt != null && cBrand != null && cMaterial != null && cColor != null
        && cType != null && cStyle != null && cFastening != null) {
      await prefs.setString('cName', cName);
      await prefs.setString('cDescribe', cDescribe);
      await prefs.setString('cQuantity', cQuantity);
      await prefs.setString('cLocation', cLocation);
      await prefs.setString('cPrice', cPrice);
      await prefs.setString('_bolt', _bolt);
      await prefs.setString('cRegion',cRegion);
      await prefs.setString('cNegotiate',cNegotiate);
      await prefs.setString('cGender',cGender);
      await prefs.setString('cBrand', cBrand);
      await prefs.setString('cMaterial', cMaterial);
      await prefs.setString('cColor', cColor);
      await prefs.setString('cType', cType);
      await prefs.setString('cFastening', cFastening);
      await prefs.setString('cStyle', cStyle);
      await pickOn();
    } else {
      Fluttertoast.showToast(msg: "FILL ALL FIELDS");
    }
  }



  Future<void> pickOn() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new ShoePic()),
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
        && cNegotiate != null && cRegion != null && cGender != null && _bolt != null && cBrand != null && cMaterial != null && cColor != null
        && cType != null && cStyle != null && cFastening != null) {
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
            'cBrand': cBrand,
            'cType': cType,
            'cMaterial': cMaterial,
            'cColor': cColor,
            'cStyle': cStyle,
            'cFastening': cFastening,
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
                          value: cType,
                          items: <String>['Boat Shoes', 'Boots', 'Basketball Shoes', 'Brogues', 'Canvas Shoes', 'Espadrilles', 'Football Shoes',
                          'Flip Flops', 'Loafers', 'Moccasines', 'Oxfords', 'Pumps', 'Sandals', 'Slides', 'Slippers',
                          'Sneakers', 'Slip Ons', 'Tennis Shoes', 'Other',]
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
                          'Brand',
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
                          hint: new Text('Select Brand'),
                          value: cBrand,
                          items: <String>['A2 by Aerosoles', 'adidas', 'Aerosoles', 'Andrew Geller', 'ASICS', 'Avengers', 'B.O.C.', 'B52 by Bullboxer',
                          'Bare Traps', 'Bates', 'Batman', 'BEARPAW', 'Ben Sherman', 'Billabong', 'Birkenstock', 'Blowfish', 'BODY GLOVE', 'Bogs', 'Born',
                          'Bostonian', 'Brooks', 'Brown Bilt', 'Bzees', 'CARLOS BY CARLOS SANTANA', 'CARS', 'Carters', 'Caterpillar', 'Circus by Sam Edelman',
                          'Clarks', 'Cliffs by White Mountain', 'Coconuts', 'Cole Haan', 'Columbia', 'Converse', 'Crevo', 'Crocs', 'DC Shoes', 'Dearfoams',
                            'Deer Stags', 'Dockers', 'Dr. Martens', 'Dr. Scholl\'s', 'Dr. Scholl\'s Orig Collection', 'Dr. Scholl\'s Work', 'Earth Origins',
                          'Eastland', 'Easy Works by Easy Street', 'eGift Card', 'Emeril', 'EUROSOFT', 'Fabletics', 'Famous Footwear', 'FANCY NANCY', 'FERGALICIOUS',
                          'Fergie', 'Fila', 'FITFLOP', 'Flexus', 'Florsheim', 'Franco Sarto', 'FROZEN', 'G BY GUESS', 'George Brown BILT', 'GEORGIA', 'Harley Davidson',
                          'Highpoint', 'Hi-Tec', 'Impo', 'Indigo Rd', 'Italian Shoemakers', 'JBU', 'JELLYPOP', 'JoJo Siwa', 'JSport', 'Jurassic Park', 'Kamik',
                          'KENNETH COLE REACTION', 'Kensie', 'Khombu', 'Koolaburra by UGG', 'K-Swiss', 'L.A. Gear', 'LaForst', 'Laredo',
                          'L\'Artiste by Spring Step', 'Levi\'s', 'LifeStride', 'Lugz', 'M.A.P.', 'Madden', 'Madden Girl', 'Magnum', 'Margaritaville',
                          'Mark Nason Skechers', 'MERRELL', 'Mickey Mouse', 'Minnetonka Moccasin', 'Minnie Mouse', 'Muk Luks', 'Natural Soul', 'Naturalizer',
                          'New Balance', 'Nike', 'Nine West Kids', 'Not Rated', 'Nunn Bush', 'OshKosh B\'gosh', 'Patrizia', 'Paw Patrol', 'Peds',
                          'Perry Ellis', 'Polo by Ralph Lauren', 'Propet', 'Puma', 'Rachel Shoes', 'Reebok', 'Reef', 'Regal', 'Report', 'ROCK & CANDY',
                          'Rocket Dog', 'Rockport', 'Rockport Works', 'Rocky', 'roxy', 'Ryka', 'Salt-Water', 'Sanuk', 'Saucony', 'Seven Dials', 'Skechers', 'Skechers Work',
                          'Sof Sole', 'SOUL Naturalizer', 'Sperry', 'Spider-Man', 'Sporto', 'Spring Step', 'Sprox', 'Stacy Adams', 'Steve Madden', 'Stride Rite',
                          'TEENAGE MUTANT NINJA TURTLES', 'Teva', 'Thomas & Friends', 'Timberland', 'Timberland Pro', 'Tommy Hilfiger', 'TOMS', 'Touch of Nina', 'TOY STORY',
                          'Trolls', 'Under Armour', 'Unisa', 'Vamperina', 'Vans', 'Vionic', 'White Mountain', 'Wolverine', 'XOXO', 'ZIGI SOHO', 'Other']
                              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
                            return MyDropdown.DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              cBrand = newValue;
                            });
                          },
                        ),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Divider(color: Colors.white,height: 20.0,),
                      new Container(
                        child: new Text(
                          'Main Material',
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
                          hint: new Text('Choose the Material'),
                          value: cMaterial,
                          items: <String>['Cotton', 'Canvas', 'Faux Leather', 'Leather', 'Nylon', 'PVC', 'Rubber', 'Suede', 'Velvet', 'Other']
                              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
                            return MyDropdown.DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              cMaterial = newValue;
                            });
                          },
                        ),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Divider(color: Colors.white,height: 20.0,),
                      new Container(
                        child: new Text(
                          'Style',
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
                          hint: new Text('Choose the Style'),
                          value: cStyle,
                          items: <String>['Casual', 'Sport', 'Formal']
                              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
                            return MyDropdown.DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              cStyle = newValue;
                            });
                          },
                        ),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),

                      new Divider(color: Colors.white,height: 20.0,),
                      new Container(
                        child: new Text(
                          'Fastening',
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
                          hint: new Text('Choose the Style'),
                          value: cFastening,
                          items: <String>['Buckle', 'Lace - Up', 'Slip On', 'Snap Fasteners', 'Velcro Strap', 'Zip']
                              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
                            return MyDropdown.DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              cFastening = newValue;
                            });
                          },
                        ),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Divider(color: Colors.white,height: 20.0,),
                      new Container(
                        child: new Text(
                          'Colour',
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
                          hint: new Text('Choose the Colour'),
                          value: cColor,
                          items: <String>['Black', 'Brown', 'Blue', 'Gold', 'Gray', 'Green', 'Orange', 'Pink', 'Purple', 'Red', 'Silver', 'Violet',
                          'White', 'Yellow', 'Other']
                              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
                            return MyDropdown.DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              cColor = newValue;
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
                          items: <String>['Women\'s', 'Men\'s','Unisex']
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
