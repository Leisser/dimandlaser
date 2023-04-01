import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:dimand/services/image_picker_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text(
          "EDIT PROFILE",
          style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
        ),
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        centerTitle: true,
      ),
      body: new EditProfileScreen(),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key key,}) : super(key: key);
  @override
  State createState() => new EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> with TickerProviderStateMixin,ImagePickerListener {
  File _image, backgroundImageFile;
  String sex, id, photoUrl,nickName,aboutMe,country,phoneNumber,address;
  AnimationController _controller;
  ImagePickerHandler imagePicker;
  SharedPreferences prefs;
  bool isLoading = false;




  @override
  void initState() {
    super.initState();
    readLocal();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    imagePicker=new ImagePickerHandler(this,_controller);
    imagePicker.init();

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
    aboutMe = prefs.getString('aboutMe') ?? '';


    // Force refresh input
    setState(() {});
  }



  Future uploadFile() async {
    String fileName = id;
    StorageReference reference = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = reference.putFile(_image);
    StorageTaskSnapshot storageTaskSnapshot;
    uploadTask.onComplete.then((value) {
      if (value.error == null) {
        storageTaskSnapshot = value;
        storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
          photoUrl = downloadUrl;
          Firestore.instance.collection('users').document(id).updateData({
            'photoUrl': photoUrl
          }).then((data) async {
            await prefs.setString('photoUrl', photoUrl);
            setState(() {
              isLoading = false;
            });
            Fluttertoast.showToast(msg: "Profile pic changed");
          }).catchError((err) {
            setState(() {
              isLoading = false;
            });
            Fluttertoast.showToast(msg: err.toString());
          });
        }, onError: (err) {

          setState(() {
            isLoading = false;
          });
          Fluttertoast.showToast(msg: 'This file is not an image');
        });
      } else {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: 'This file is not an image');
      }
    }, onError: (err) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: err.toString());
    });
  }




  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  void handleUpdateData() {

    setState(() {
      isLoading = true;
    });

    Firestore.instance.collection('users').document(id).updateData({'nickname': nickName, 'aboutMe': aboutMe, 'country': country, 'address': address,
      'phoneNumber': phoneNumber, 'sex': sex}).then((data) async {
      prefs = await SharedPreferences.getInstance();
      await prefs.setString('nickname', nickName);
      await prefs.setString('aboutMe', aboutMe);
      await prefs.setString('country', country);
      await prefs.setString('address', address);
      await prefs.setString('phoneNumber', phoneNumber);
      await prefs.setString('sex', sex);

      setState(() {
        isLoading = false;
      });

      Fluttertoast.showToast(msg: "Update success");
    }).catchError((err) {
      setState(() {
        isLoading = false;
      });

      Fluttertoast.showToast(msg: err.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;
    return new SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new Stack(
              children: <Widget>[
                // Background
                (backgroundImageFile == null)
                    ? new Image.asset(
                  'assets/images/bg_uit.jpg',
                  width: double.infinity,
                  height: 150.0,
                  fit: BoxFit.cover,
                )
                    : new Image.file(
                  backgroundImageFile,
                  width: double.infinity,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),

                // Avatar and button
                new Positioned(
                  child: new Stack(
                    children: <Widget>[
                      new Container(
                          padding: EdgeInsets.all(20.0),
                          height: 70.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: photoUrl != null ? NetworkImage(photoUrl): AssetImage('assets/images/ic_avatar.png'),
                            ),
                          )),
                      new Material(
                        child: new IconButton(
                          icon: new Image.asset(
                            'assets/images/ic_camera.png',
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.cover,
                          ),
                          onPressed: () => imagePicker.showDialog(context),
                          padding: new EdgeInsets.all(0.0),
                          highlightColor: Colors.black,
                          iconSize: 70.0,
                        ),
                        borderRadius: new BorderRadius.all(new Radius.circular(40.0)),
                        color: Colors.grey.withOpacity(0.0),
                      ),
                    ],
                  ),
                  top: 115.0,
                  left: MediaQuery.of(context).size.width / 2 - 70 / 2,
                )
              ],
            ),
            width: double.infinity,
            height: 200.0,
          ),
          new Column(
            children: <Widget>[
              // Username
              new Container(
                child: new Text(
                  'Name (Your real name in full)',
                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.black),
                ),
                margin: new EdgeInsets.only(left: 10.0, bottom: 5.0, top: 10.0),
              ),
              new Container(
                child: new TextField(
                  decoration: new InputDecoration(
                      hintText: 'Kate Shan Ivy',
                      border: new UnderlineInputBorder(),
                      contentPadding: new EdgeInsets.all(5.0),
                      hintStyle: new TextStyle(color: Colors.grey)),
                  onChanged: (value) {
                    nickName = value;
                  },
                  keyboardType: TextInputType.text,
                ),
                margin: new EdgeInsets.only(left: 30.0, right: 30.0),
              ),

              // Country
              new Container(
                child: new Text(
                  'Country',
                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.black),
                ),
                margin: new EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
              ),
              new Container(
                child: new TextField(
                  decoration: new InputDecoration(
                      hintText: 'Uganda',
                      border: new UnderlineInputBorder(),
                      contentPadding: new EdgeInsets.all(5.0),
                      hintStyle: new TextStyle(color: Colors.grey)),
                  onChanged: (value) {
                    country = value;
                  },
                  keyboardType: TextInputType.text,
                ),
                margin: new EdgeInsets.only(left: 30.0, right: 30.0),
              ),

              // Address
              new Container(
                child: new Text(
                  'Address',
                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.black),
                ),
                margin: new EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
              ),
              new Container(
                child: new TextField(
                  decoration: new InputDecoration(
                      hintText: 'Kireka B, kinawataka Road',
                      border: new UnderlineInputBorder(),
                      contentPadding: new EdgeInsets.all(5.0),
                      hintStyle: new TextStyle(color: Colors.grey)),

                  onChanged: (value) {
                    address = value;
                  },

                ),
                margin: new EdgeInsets.only(left: 30.0, right: 30.0),
              ),

              // About me
              new Container(
                child: new Text(
                  'About me',
                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.black),
                ),
                margin: new EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
              ),
              new Container(
                child: new TextField(
                  decoration: new InputDecoration(
                      hintText: 'Fun, like travel, read book and play PES!!!',
                      border: new UnderlineInputBorder(),
                      contentPadding: new EdgeInsets.all(5.0),
                      hintStyle: new TextStyle(color: Colors.grey)),
                  onChanged: (value) {
                    aboutMe = value;
                  },
                ),
                margin: new EdgeInsets.only(left: 30.0, right: 30.0),
              ),

              // About me
              new Container(
                child: new Text(
                  'Phone',
                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.black),
                ),
                margin: new EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
              ),
              new Container(
                child: new TextField(
                  decoration: new InputDecoration(
                      hintText: '+256 784794196',
                      border: new UnderlineInputBorder(),
                      contentPadding: new EdgeInsets.all(5.0),
                      hintStyle: new TextStyle(color: Colors.grey)),
                  onChanged: (value) {
                    phoneNumber = value;
                  },
                  keyboardType: TextInputType.text,
                ),
                margin: new EdgeInsets.only(left: 30.0, right: 30.0),
              ),

              // Sex
              new Container(
                child: new Text(
                  'Gender',
                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.black),
                ),
                margin: new EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
              ),
              new Container(
                child: new TextField(
                  decoration: new InputDecoration(
                      hintText: 'Male or Female',
                      border: new UnderlineInputBorder(),
                      contentPadding: new EdgeInsets.all(5.0),
                      hintStyle: new TextStyle(color: Colors.grey)),
                  onChanged: (value) {
                    sex = value;
                  },
                  keyboardType: TextInputType.text,
                ),
                margin: new EdgeInsets.only(left: 30.0, right: 30.0),
              ),

              new Divider(color: Colors.cyan[300],height: 30.0,),

              new Container(
                width: 150.0,
                height: 50.0,
                alignment: Alignment.center,
                child: new RaisedButton(
                  onPressed: handleUpdateData,
                  child: new Text("Save",style: new TextStyle(color: Colors.white),),
                  color: Colors.green[600],
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)
                  ),
                ),
              ),

            ],
            crossAxisAlignment: CrossAxisAlignment.start,

          )
        ],
      ),
      padding: new EdgeInsets.only(bottom: 20.0),
    );
  }

  @override
  userImage(File _image) {
    setState(() {
      this._image = _image;
    });
    uploadFile();
  }
}