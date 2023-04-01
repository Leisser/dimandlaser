import 'package:flutter/material.dart';
import 'package:dimand/pages/category/real/commer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dimand/pages/category/real/ecv.dart';
import 'package:dimand/pages/category/real/houseApr.dart';
import 'package:dimand/pages/category/real/land.dart';

class Estate extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => new Scaffold(
    resizeToAvoidBottomPadding: false,
    appBar: AppBar(
      leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){Navigator.pop(context);}),
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text('Real Estates'),
    ),
    body: new ListPage(),
  );
}

class ListPage extends StatefulWidget {

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  james() {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new Commer()),
    );
  }
  sandra() {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new Ecv()),
    );
  }
  kate() {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new Land()),
    );
  }

  peace() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new HouseApr()),
    );
  }

  cris() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('dora', 'Commercial Property For Rent');
    await james();
  }

  hilda() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('dora', 'Commercial Property For Sell');
    await james();
  }
  ivy() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('dora', 'Houses And Apartments For Rent');
    await peace();
  }
  shan() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('dora', 'Houses And Apartments For Buying');
    await peace();
  }
  inno() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('dora', 'Land & Plots For Rent');
    await kate();
  }
  nuri() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('dora', 'Land & Plots For Buying');
    await kate();
  }

  @override
  Widget build(BuildContext context) {

    final makeBody = ListView(
      children: <Widget>[
        Container(
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          color: Color.fromRGBO(64, 75, 96, .9),
          child: ListTile(
            onTap: cris,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Commercial Property For Rent",
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
            onTap: hilda,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Commercial Property For Buying",
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
            onTap: sandra,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Event Centers & Venues",
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
            onTap: ivy,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Houses And Apartments For Rent",
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
            onTap: shan,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Houses And Apartments For Buying",
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
            onTap: inno,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Land & Plots For Rent",
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
            onTap: nuri,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Land & Plots For Buying",
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