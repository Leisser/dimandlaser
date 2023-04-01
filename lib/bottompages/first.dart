import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dimand/pages/dimpo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dimand/bottompages/product_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dimand/bottompages/fourth.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new EditFirstScreen(),
    );
  }

}

class EditFirstScreen extends StatefulWidget{

  State createState() => new EditFirstScreenState();

}

class EditFirstScreenState extends State<EditFirstScreen> with SingleTickerProviderStateMixin {
  SharedPreferences prefs;
  String sex, id, photoUrl,nickName,aboutMe,country,phoneNumber,address;
  Firestore firestore = Firestore.instance;
  List<DocumentSnapshot> dimandPosts = [];
  bool loadingDimandPosts = true;
  int perPage = 10;
  bool gettingMoreProducts = false;
  bool gettingMoreSearchProducts = false;
  bool moreProductsAvailable = true;
  bool moreSearchProductsAvailable = true;
  DocumentSnapshot lastDocument;
  DocumentSnapshot lastDocuments;
  ScrollController _scrollController = ScrollController();
  static final GlobalKey<ScaffoldState> scaffoldKey =
  new GlobalKey<ScaffoldState>();

  TextEditingController _searchQuery;
  bool _isSearching = false;
  bool draw = true;
  String searchQuery = 'hairPinLeft';

  dim(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new Dirty()),
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
    aboutMe = prefs.getString('aboutMe') ?? '';
    await dub();



    // Force refresh input
    setState(() {});
  }

  Future<void> dub() async {
    if (address.isEmpty || address == null && phoneNumber.isEmpty || phoneNumber == null && country.isEmpty || country == null &&
        sex.isEmpty  || sex == null && aboutMe.isEmpty || aboutMe == null){
      await pickup();
    }else {
      Fluttertoast.showToast(msg: "All SET");
    }
  }

  Future<void> pickup() async {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => new EditProfile()),
          (Route<dynamic> route) => false,
    );

  }

  void _startSearch() {
    print("open search box");
    ModalRoute
        .of(context)
        .addLocalHistoryEntry(new LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }
  dumper() async{
    _searchQuery = new TextEditingController();
    getSearchPosts();
    print(searchQuery);
  }



  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    print("close search box");
    setState(() {
      _searchQuery.clear();
      updateSearchQuery("Search query");
      getDimandPosts();
    });
  }

  Widget _buildTitle(BuildContext context) {
    var horizontalTitleAlignment =
    Platform.isIOS ? CrossAxisAlignment.center : CrossAxisAlignment.start;

    return new InkWell(
      onTap: () => scaffoldKey.currentState.openDrawer(),
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: horizontalTitleAlignment,
          children: <Widget>[
            const Text('dimand'),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return new TextField(
      controller: _searchQuery,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
        hintStyle: const TextStyle(color: Colors.white30),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: updateSearchQuery,
    );
  }

  void updateSearchQuery(String newQuery) {

    setState(() {
      searchQuery = newQuery;
    });
    print("search query " + newQuery);

  }

  List<Widget> _buildActions() {

    if (_isSearching) {
      return <Widget>[
        new IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQuery == null || _searchQuery.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      new IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _searchQuery = new TextEditingController();
    readLocal();
    getDimandPosts();
    _scrollController.addListener(() {
      if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        Fluttertoast.showToast(msg: "LOADING MORE.....");
          getMoreDimandPosts();

      }
    });
  }

  getDimandPosts() async {
      Query q = firestore.collection('dimandPosts').orderBy(
          'timestamp', descending: true).limit(perPage);
      setState(() {
        loadingDimandPosts = true;
      });
      QuerySnapshot querySnapshot = await q.getDocuments();
      dimandPosts = querySnapshot.documents;
      lastDocument =
      querySnapshot.documents[querySnapshot.documents.length - 1];
      setState(() {
        loadingDimandPosts = false;
      });

  }

  getSearchPosts() async{
    Query p = firestore.collection('dimandPosts').where('cName', isEqualTo: searchQuery).orderBy(
        'timestamp', descending: true).limit(perPage);
    setState(() {
      loadingDimandPosts = true;
    });
    QuerySnapshot querySnapshot = await p.getDocuments();
    dimandPosts = querySnapshot.documents;
    lastDocuments =
    querySnapshot.documents[querySnapshot.documents.length - 1];
    moreProductsAvailable = false;
    setState(() {
      loadingDimandPosts = false;
    });
  }

  getMoreDimandPosts() async {

    if(moreProductsAvailable == false){
      await getMoreSearchPosts();
    }

    if(gettingMoreProducts == true){
      return;
    }

    gettingMoreProducts = true;
    Query q = firestore.collection("dimandPosts").orderBy("timestamp", descending: true).startAfter([lastDocument['timestamp']]).limit(perPage);

    QuerySnapshot querySnapshot = await q.getDocuments();
    if(querySnapshot.documents.length == 0 ) {
      moreProductsAvailable = false;
    }
    lastDocument = querySnapshot.documents[querySnapshot.documents.length - 1];
    dimandPosts.addAll(querySnapshot.documents);
    setState(() {});
    gettingMoreProducts = false;
  }

  getMoreSearchPosts() async {

    if(moreSearchProductsAvailable == false){
      Fluttertoast.showToast(msg: "No MORE POSTS");
    }

    if(gettingMoreSearchProducts == true){
      return;
    }

    gettingMoreSearchProducts = true;
    Query p = firestore.collection("dimandPosts").where('cName', isEqualTo: searchQuery).orderBy("timestamp", descending: true).startAfter([lastDocuments['timestamp']]).limit(perPage);

    QuerySnapshot querySnapshot = await p.getDocuments();
    if(querySnapshot.documents.length == 0 ) {
      moreSearchProductsAvailable = false;
    }
    lastDocuments = querySnapshot.documents[querySnapshot.documents.length - 1];
    dimandPosts.addAll(querySnapshot.documents);
    setState(() {});
    gettingMoreSearchProducts = false;
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        key: scaffoldKey,
        appBar: new AppBar(
          backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        leading: _isSearching ? const BackButton() : null,
    title: _isSearching ? _buildSearchField() : _buildTitle(context),
    actions: _buildActions(),
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: new RaisedButton(
            onPressed: dim,
            child: new Text('CLICK HERE TO POST WHAT YOU WANT TO BUY',style: new TextStyle(color: Colors.white),),
            color: Color.fromRGBO(58, 66, 86, 1.0),
          ),
        ),
        new Container(
          child: _isSearching ? new RaisedButton(
            color: Colors.orange,
            child: Text("SEARCH"),
            onPressed: dumper,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)
            ),
          ) : null,
        ),
        new Expanded(
            child: loadingDimandPosts == true
                ? Container(
              child: Center(
                child: Text('Loading'),
              ),
            )
                : Column(
                children: [
                  Expanded(
                    child: dimandPosts.length == 0
                        ? Center(
                      child: Text('No products to show...'),
                    )
                        : GridView.builder(
                      physics: ScrollPhysics(),
                      controller: _scrollController,
                      itemCount: dimandPosts.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 1.5),),
                      itemBuilder: (BuildContext context, int index) {
                        DocumentSnapshot ds = dimandPosts[index];
                        String cName = ds["cName"];
                        String pic1 = ds["pic1"];
                        String cPrice = ds["cPrice"];
                        String cLocation = ds["cLocation"];
                        String cDescribe =ds["cDescribe"];
                        String cLead =ds["cLead"];
                        String cQuantity =ds["cQuantity"];
                        String country =ds["country"];
                        String ip =ds["id"];
                        String cType =ds["cType"];
                        String cRegion=ds["cRegion"];
                        String cNegotiate =ds["cNegotiate"];
                        String cGender =ds["cGender"];
                        String cAge =ds["cAge"];
                        String cCondition =ds["cCondition"];
                        String cSize =ds["cSize"];
                        String cMaterial =ds["cMaterial"];
                        String cColor =ds["cColor"];
                        String cBrand =ds["cBrand"];
                        String cShape =ds["cShape"];
                        String cPeriod =ds["cPeriod"];
                        String cMake =ds["cMake"];
                        String cModel =ds["cModel"];
                        String cTransmission =ds["cTransmission"];
                        String cBreed =ds["cBreed"];
                        String cSubtype =ds["cSubtype"];
                        String cLevel =ds["cLevel"];
                        String cSpot =ds["cSpot"];
                        String cRound =ds["cRound"];
                        String cParking =ds["cParking"];
                        String cFurnish =ds["cFurnish"];
                        String cOpenType =ds["cOpenType"];
                        String cEqupment =ds["cEqupment"];
                        String cForm =ds["cForm"];
                        String cFormular =ds["cFormular"];
                        String cScent =ds["cScent"];
                        String cRoom =ds["cRoom"];
                        String cBedroom =ds["cBedroom"];
                        String cBathroom =ds["cBathroom"];
                        String cPower =ds["cPower"];
                        String cStone =ds["cStone"];
                        String cSalary =ds["cSalary"];
                        String cExperience =ds["cExperience"];
                        String cCareer =ds["cCareer"];
                        String cRequirement =ds["cRequirement"];
                        String cSquareM =ds["cSquareM"];
                        String cLoading =ds["cLoading"];
                        String cPayType =ds["cPayType"];
                        String cFreigh =ds["cFreigh"];
                        String cTransport =ds["cTransport"];
                        String cTone =ds["cTone"];
                        String cColour =ds["cColour"];
                        String cSubType =ds["cSubType"];
                        String cInclude =ds["cInclude"];
                        String cFastening =ds["cFastening"];
                        String cSkinType =ds["cSkinType"];
                        String cBenefits =ds["cBenefits"];
                        String cPackage =ds["cPackage"];
                        String cPlatform =ds["cPlatform"];
                        String cDestination =ds["cDestination"];
                        String cDuration =ds["cDuration"];
                        String cGenre =ds["cGenre"];
                        String cCaseMaterial =ds["cCaseMaterial"];
                        String cBandMaterial =ds["cBandMaterial"];
                        String cFeatures =ds["cFeatures"];
                        String cBandColor =ds["cBandColor"];
                        String cCaseColor =ds["cCaseColor"];
                        String cStyle =ds["cStyle"];
                        String cDisplay =ds["cDisplay"];
                        String nickname =ds["nickname"];
                        String phoneNumber =ds["phoneNumber"];
                        String photoUrl =ds["photoUrl"];
                        String sex =ds["sex"];
                        DateTime dd = new DateTime.fromMillisecondsSinceEpoch(ds["timestamp"]);
                        String pic2 =ds["pic2"];
                        String pic3 =ds["pic3"];
                        String pic4 =ds["pic4"];
                        String pic5 =ds["pic5"];
                        String pic6 =ds["pic6"];
                        String pic7 =ds["pic7"];
                        String pic8 =ds["pic8"];
                        String pic9 =ds["pic9"];
                        String pic10 =ds["pic10"];
                        String address =ds["address"];
                        String pip = ds.documentID;

                        return new Card(
                          clipBehavior: Clip.hardEdge,
                          color:Colors.white,
                          margin: EdgeInsets.all(4.0),
                          elevation: 5,
                          child:InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) =>
                                      new FullScreenImagePage( pic1, pic2, pic3, pic4, pic5, pic6, pic7, pic8, pic9, pic10, cDescribe, cName, cPrice, cLocation, address, cLead, cQuantity, country, ip, nickname, phoneNumber, photoUrl, id, sex, pip, dd,
                                          cType, cRegion, cNegotiate, cGender, cAge, cCondition, cSize, cMaterial, cColor, cBrand, cShape, cPeriod, cMake, cModel, cTransmission, cBreed, cSubtype, cLevel,
                                          cSpot, cRound, cParking, cFurnish, cOpenType, cEqupment, cForm, cFormular, cScent, cRoom, cBedroom, cBathroom, cPower, cStone, cSalary, cExperience, cCareer,
                                          cRequirement, cSquareM, cLoading, cPayType, cFreigh, cTransport, cTone, cColour, cSubType, cInclude, cFastening, cSkinType, cBenefits, cPackage, cPlatform,
                                          cDestination, cDuration, cGenre, cCaseMaterial, cBandMaterial, cFeatures, cBandColor, cCaseColor, cStyle, cDisplay)));},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: <Widget>[
                                      Container(
                                        height: MediaQuery.of(context).size.height,
                                        width: MediaQuery.of(context).size.width,
                                        child: new FadeInImage(
                                          placeholder: AssetImage(
                                            'assets/images/laser.jpg',
                                          ),
                                          image: pic1 != null ? NetworkImage(pic1): AssetImage('assets/images/laser.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    new Container(
                                      child: Text(
                                        "Name $cName\nPrice $cPrice\nLocation $cLocation",
                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic,),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),


                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ]),)
      ],

    )

    );
  }

}

class LostCard extends StatelessWidget {

  //All the card variables
  final String cName, id, photoUrl, nickName, country, phoneNumber, address, cType,
      cQuantity, cPrice, cLocation, cLead, cDescribe, sex, pic1;
  final IconData icon;
  final Color iconBackgroundColor;
  final ShapeBorder shape;


  LostCard({

    this.icon,
    this.iconBackgroundColor,
    this.shape, this.cName, this.id, this.photoUrl, this.nickName, this.country, this.phoneNumber, this.address, this.cQuantity, this.cPrice, this.cLocation, this.cLead, this.cDescribe, this.sex, this.pic1, this.cType,

  });



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      children: <Widget>[
        new Card(
          margin: EdgeInsets.all(1.0),
          elevation: 4.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: new FadeInImage(
                          placeholder: AssetImage(
                            'assets/images/laser.jpg',
                          ),
                          image: pic1 != null ? NetworkImage(pic1): AssetImage('assets/images/laser.jpg'),
                          fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Align(
                        alignment: FractionalOffset.topLeft,
                        child: CircleAvatar(
                          backgroundColor: Colors.redAccent,
                          radius: 15.0,
                          child: Text(
                            cName,
                            textScaleFactor: 0.5,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Align(
                      alignment: FractionalOffset.topRight,
                      child: Container(
                        color: Colors.blueAccent,
                        height: 0,
                        width: 0,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.account_circle),
                              Text(
                                "1P",
                                textScaleFactor: 0.5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(0.0),
                  alignment: FractionalOffset.bottomCenter,
                  child: Text(
                    cPrice,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "\$5",
                    style: TextStyle(color: Colors.grey[500]),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

}