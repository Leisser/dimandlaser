import 'package:flutter/material.dart';
import 'package:dimand/pages/category/elect/audio.dart';
import 'package:dimand/pages/category/elect/cva.dart';
import 'package:dimand/pages/category/elect/compac.dart';
import 'package:dimand/pages/category/elect/hard.dart';
import 'package:dimand/pages/category/elect/compmo.dart';
import 'package:dimand/pages/category/elect/soft.dart';
import 'package:dimand/pages/category/elect/lopcom.dart';
import 'package:dimand/pages/category/elect/tv.dart';
import 'package:dimand/pages/category/elect/vgc.dart';
import 'package:dimand/pages/category/elect/vg.dart';

class Electronics extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => new Scaffold(
    resizeToAvoidBottomPadding: false,
    appBar: AppBar(
      leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){Navigator.pop(context);}),
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text('Electronics'),
    ),
    body: new ListPage(),
  );
}

class ListPage extends StatefulWidget {


  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  piano() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new Audio()),
    );

  }
  drum() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new Camera()),
    );

  }

  guitar() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new CompAc()),
    );

  }

  trumpet() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new Hard()),
    );

  }

  violin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new CompMo()),
    );

  }

  cellos() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new Soft()),
    );

  }

  flutes() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new LopCom()),
    );

  }

  harp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new Tv()),
    );

  }

  organ() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new Vgc()),
    );

  }

  bell() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new Vg()),
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
            onTap: piano,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Audio & Music Equipments",
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
            onTap: drum,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Cameras, Video Cameras & Accessories",
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
            onTap: guitar,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Computer Accessories",
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
            onTap: trumpet,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Computer Hardware",
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
            onTap: violin,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Computer Monitors",
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
            onTap: cellos,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Computer Software",
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
            onTap: flutes,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Laptops & Computers",
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
            onTap: harp,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "TV & DVD Equipment",
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
            onTap: organ,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Video Game Consoles",
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
            onTap: bell,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Video Games",
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