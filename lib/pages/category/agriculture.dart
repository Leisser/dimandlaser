import 'package:flutter/material.dart';
import 'package:dimand/pages/category/agric/machinery.dart';
import 'package:dimand/pages/category/agric/feed.dart';
import 'package:dimand/pages/category/agric/livestock.dart';
import 'package:dimand/pages/category/agric/meals.dart';

class Agro extends StatelessWidget {

  @override
  Widget build(BuildContext context) => new Scaffold(
    resizeToAvoidBottomPadding: false,
    appBar: AppBar(
      leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){Navigator.pop(context);}),
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text('Agriculture & Edibles'),
    ),
    body: new AgListPage(),
  );
}

class AgListPage extends StatefulWidget {

  @override
  _AgListPageState createState() => _AgListPageState();
}

class _AgListPageState extends State<AgListPage> {

  machinery(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MacheneryT()),
    );
  }

  feeds(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Feeds()),
    );
  }

  livestock(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>Livestock()),
    );
  }

  meals(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Meal()),
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
            onTap: machinery,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Machinery & Tools",
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
            onTap: feeds,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Feeds, Supplements and seeds",
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
            onTap: livestock,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Livestock & Poultry",
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
            onTap: meals,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Meals & Drinks",
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