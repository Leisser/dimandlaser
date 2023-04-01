import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:mock_data/mock_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dimand/bottompages/first.dart';




class ToyPic extends StatefulWidget {
  @override
  DoAppState createState() => new DoAppState();
}

class DoAppState extends State<ToyPic> {
  List<Asset> images = List<Asset>();
  String uploadUrls;
  SharedPreferences prefs;
  String cName, id, photoUrl, nickName, country, phoneNumber, address,
      cQuantity, cPrice, cLocation, cLead, cDescribe, sex, cGender, cRegion, cNegotiate, cType, cAge;
  String pic1, pic2, pic3, pic4, pic5, pic6, pic7, pic8, pic9, pic10, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10;
  bool _load = false;
  String category = 'Babies & Kids';
  String subcategory = 'Toys';

  @override
  void initState() {
    super.initState();
    readLocal();
    loadAssets();

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
    cName = prefs.getString('cName') ?? '';
    cDescribe = prefs.getString('cDescribe') ?? '';
    cQuantity = prefs.getString('cQuantity') ?? '';
    cLead = prefs.getString('_bolt') ?? '';
    cLocation = prefs.getString('cLocation') ?? '';
    cPrice = prefs.getString('cPrice') ?? '';
    cRegion = prefs.getString('cRegion') ?? '';
    cNegotiate = prefs.getString('cNegotiate') ?? '';
    cGender = prefs.getString('cGender') ?? '';
    cAge = prefs.getString('cAge') ?? '';
    cType = prefs.getString('cType') ?? '';



    // Force refresh input
    setState(() {});
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  final TextStyle textstyle =
  TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  final InputDecoration decoration = InputDecoration(
    border: OutlineInputBorder(),
  );

  Future<List<String>> uploadImage(
      {@required String fileName, @required List<Asset> assets}) async {
    List<String> uploadUrls = [];
    fileName = mockString(50);
    List<Asset> assets = images;
    uploadUrls.clear();

    await Future.wait(assets.map((Asset asset) async {
      ByteData byteData = await asset.requestOriginal();
      List<int> imageData = byteData.buffer.asUint8List();

      StorageReference reference = FirebaseStorage.instance.ref().child(fileName);
      fileName = await mockString(50);
      StorageUploadTask uploadTask = reference.putData(imageData);
      StorageTaskSnapshot storageTaskSnapshot;


      StorageTaskSnapshot snapshot = await uploadTask.onComplete;
      if (snapshot.error == null) {
        storageTaskSnapshot = snapshot;
        final String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
        uploadUrls.add(downloadUrl);



        print('Upload success');
      } else {
        print('Error from image repo ${snapshot.error.toString()}');
        throw ('This file is not an image');
      }
    }), eagerError: true, cleanUp: (_) {
      print('eager cleaned up');
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();


    await prefs.setStringList('myList', uploadUrls);

    if (uploadUrls.length ==0) {
      p1 =null;
      p2 =null;
      p3 = null;
      p4 = null;
      p5 = null;
      p6 = null;
      p7 = null;
      p8 = null;
      p9 = null;
      p10 = null;
    } else if (uploadUrls.length ==1) {
      p1 =uploadUrls[0];
      p2 =null;
      p3 = null;
      p4 = null;
      p5 = null;
      p6 = null;
      p7 = null;
      p8 = null;
      p9 = null;
      p10 = null;
    } else if (uploadUrls.length ==2) {
      p1 =uploadUrls[0];
      p2 =uploadUrls[1];
      p3 = null;
      p4 = null;
      p5 = null;
      p6 = null;
      p7 = null;
      p8 = null;
      p9 = null;
      p10 = null;
    } else if (uploadUrls.length ==3) {
      p1 =uploadUrls[0];
      p2 =uploadUrls[1];
      p3 = uploadUrls[2];
      p4 = null;
      p5 = null;
      p6 = null;
      p7 = null;
      p8 = null;
      p9 = null;
      p10 = null;
    } else if (uploadUrls.length ==4) {
      p1 =uploadUrls[0];
      p2 =uploadUrls[1];
      p3 = uploadUrls[2];
      p4 = uploadUrls[3];
      p5 = null;
      p6 = null;
      p7 = null;
      p8 = null;
      p9 = null;
      p10 = null;
    } else if (uploadUrls.length ==5) {
      p1 =uploadUrls[0];
      p2 =uploadUrls[1];
      p3 = uploadUrls[2];
      p4 = uploadUrls[3];
      p5 = uploadUrls[4];
      p6 = null;
      p7 = null;
      p8 = null;
      p9 = null;
      p10 = null;
    } else if (uploadUrls.length ==6) {
      p1 =uploadUrls[0];
      p2 =uploadUrls[1];
      p3 = uploadUrls[2];
      p4 = uploadUrls[3];
      p5 = uploadUrls[4];
      p6 = uploadUrls[5];
      p7 = null;
      p8 = null;
      p9 = null;
      p10 = null;
    } else if (uploadUrls.length ==7) {
      p1 =uploadUrls[0];
      p2 =uploadUrls[1];
      p3 = uploadUrls[2];
      p4 = uploadUrls[3];
      p5 = uploadUrls[4];
      p6 = uploadUrls[5];
      p7 = uploadUrls[6];
      p8 = null;
      p9 = null;
      p10 = null;
    } else if (uploadUrls.length ==8) {
      p1 =uploadUrls[0];
      p2 =uploadUrls[1];
      p3 = uploadUrls[2];
      p4 = uploadUrls[3];
      p5 = uploadUrls[4];
      p6 = uploadUrls[5];
      p7 = uploadUrls[6];
      p8 = uploadUrls[7];
      p9 = null;
      p10 = null;
    } else if (uploadUrls.length ==9) {
      p1 =uploadUrls[0];
      p2 =uploadUrls[1];
      p3 = uploadUrls[2];
      p4 = uploadUrls[3];
      p5 = uploadUrls[4];
      p6 = uploadUrls[5];
      p7 = uploadUrls[6];
      p8 = uploadUrls[7];
      p9 = uploadUrls[7];
      p10 = null;
    } else if (uploadUrls.length ==10) {
      p1 =uploadUrls[0];
      p2 =uploadUrls[1];
      p3 = uploadUrls[2];
      p4 = uploadUrls[3];
      p5 = uploadUrls[4];
      p6 = uploadUrls[5];
      p7 = uploadUrls[6];
      p8 = uploadUrls[7];
      p9 = uploadUrls[7];
      p10 = uploadUrls[9];
    }else {
      p1 =uploadUrls[0];
      p2 =uploadUrls[1];
      p3 = uploadUrls[2];
      p4 = uploadUrls[3];
      p5 = uploadUrls[4];
      p6 = uploadUrls[5];
      p7 = uploadUrls[6];
      p8 = uploadUrls[7];
      p9 = uploadUrls[7];
      p10 = uploadUrls[9];
    }
    await prefs.setString('cName', null);
    await prefs.setString('cDescribe', null);
    await prefs.setString('cQuantity', null);
    await prefs.setString('cLead', null);
    await prefs.setString('cLocation', null);
    await prefs.setString('cPrice', null);
    dim();

    return uploadUrls;


  }


  dim(){
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => PageOne()),
          (Route<dynamic> route) => false,
    );

  }


  void handleUpdateDim() async{
    setState((){
      _load=true;
    });
    String docName;
    docName = mockString(50);
    await uploadImage();

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
          'cGender': cGender,
          'cRegion': cRegion,
          'cNegotiate': cNegotiate,
          'category': category,
          'subcategory': subcategory,
          'cType': cType,
          'cAge': cAge,
          'timestamp': DateTime.now().millisecondsSinceEpoch,
          'pic1': p1,
          'pic2': p2,
          'pic3': p3,
          'pic4': p4,
          'pic5': p5,
          'pic6': p6,
          'pic7': p7,
          'pic8': p8,
          'pic9': p9,
          'pic10': p10,
        });


    Fluttertoast.showToast(msg: "Update success");
  }


  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
          maxImages: 300,
          enableCamera: true,
          selectedAssets: images,
          cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
          materialOptions: MaterialOptions(
            actionBarColor: "#abcdef",
            actionBarTitle: "Example App",
            allViewTitle: "All Photos",
            selectCircleStrokeColor: "#000000",
          ));
    } on PlatformException catch (e) {
      error = e.message;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget loadingIndicator =_load? new Container(
      color: Colors.orange[300],
      width: 70.0,
      height: 70.0,
      child: new Padding(padding: const EdgeInsets.all(5.0),child: new Center(child: new CircularProgressIndicator())),
    ):new Container();
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){Navigator.pop(context);}),
          title: const Text('Getting pics'),
          backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              color: Colors.blue,
              child: Text("ADD OR CHANGE IMAGES", style: textstyle,),
              onPressed: loadAssets,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)
              ),
            ),
            RaisedButton(
              color: Colors.green,
              child: Text("UPLOAD POST", style: textstyle,),
              onPressed: handleUpdateDim,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)
              ),
            ),
            new Align(child: loadingIndicator,alignment: FractionalOffset.center,),
            Expanded(
              child: buildGridView(),
            ),
          ],
        ),
      ),
    );
  }
}