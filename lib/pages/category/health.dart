import 'package:flutter/material.dart';
import 'package:dimand/pages/category/healt/bath.dart';
import 'package:dimand/pages/category/healt/fragr.dart';
import 'package:dimand/pages/category/healt/hair.dart';
import 'package:dimand/pages/category/healt/make.dart';
import 'package:dimand/pages/category/healt/sexual.dart';
import 'package:dimand/pages/category/healt/skin.dart';
import 'package:dimand/pages/category/healt/skintool.dart';
import 'package:dimand/pages/category/healt/skinv.dart';

class Health extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => new Scaffold(
    resizeToAvoidBottomPadding: false,
    appBar: AppBar(
      leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){Navigator.pop(context);}),
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text('Health & Beauty'),
    ),
    body: new ListPage(),
  );
}

class ListPage extends StatefulWidget {

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  buganda(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Bath()),
    );
  }
  clan(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Fragrance()),
    );
  }
  totem(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Hair()),
    );
  }
  taboo(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Make()),
    );
  }
  kabaka(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Sexual()),
    );
  }
  motto(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Skin()),
    );
  }
  seat(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SkinTool()),
    );
  }
  katikiro(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SkinV()),
    );
  }

  @override
  Widget build(BuildContext context) {

    final makeBody = ListView(
      children: <Widget>[
        Container(
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          color: Color.fromRGBO(64, 75, 96, .9),
          child: ListTile(
            onTap: buganda,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Bath & Body",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
            trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          ),
        ),
        Container(
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          color: Color.fromRGBO(64, 75, 96, .9),
          child: ListTile(
            onTap: clan,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Fragrance",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
            trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          ),
        ),
        Container(
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          color: Color.fromRGBO(64, 75, 96, .9),
          child: ListTile(
            onTap: totem,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Hair Beauty",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
            trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          ),
        ),
        Container(
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          color: Color.fromRGBO(64, 75, 96, .9),
          child: ListTile(
            onTap: taboo,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Makeup",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
            trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          ),
        ),
        Container(
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          color: Color.fromRGBO(64, 75, 96, .9),
          child: ListTile(
            onTap: kabaka,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Sexual Wellness",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
            trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          ),
        ),
        Container(
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          color: Color.fromRGBO(64, 75, 96, .9),
          child: ListTile(
            onTap: motto,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Skin Care",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
            trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          ),
        ),
        Container(
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          color: Color.fromRGBO(64, 75, 96, .9),
          child: ListTile(
            onTap: seat,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Tools & Accessories",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
            trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          ),
        ),
        Container(
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          color: Color.fromRGBO(64, 75, 96, .9),
          child: ListTile(
            onTap: katikiro,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Vitamins & Supplements",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
            trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          ),
        ),
        ],
    );


    return makeBody;
  }
}