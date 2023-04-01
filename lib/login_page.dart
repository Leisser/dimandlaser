import 'package:flutter/material.dart';
import 'package:dimand/auth.dart';
import 'package:dimand/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({this.onSignedIn});
  final VoidCallback onSignedIn;


  @override
  State<StatefulWidget> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  SharedPreferences prefs;




  Future<void> giris(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    try {
      final BaseAuth auth = AuthProvider.of(context).auth;
      await auth.signin();
      widget.onSignedIn();
    } catch (e) {
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black
        ,
        body: new ListView(
          children: <Widget>[
            new Padding(padding: const EdgeInsets.only(top: 30.0)),
            new Image(image: new AssetImage('assets/images/laser.jpg'),width: 128.0,height: 128.0),
            new Padding(padding: const EdgeInsets.only(top: 10.0)),
            new Text(
              "Welcome to dimandlaser",
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan[600],
                  fontSize: 20.0
              ),
              textAlign: TextAlign.center,
            ),
            new Padding(
              padding: const EdgeInsets.all(30.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Container(
                    width: 100.0,
                    height: 50.0,
                    child: new RaisedButton.icon(
                      icon: Icon(Icons.shopping_cart,color: Colors.white,),
                      onPressed: gatya,
                      label: new Text("Needs that match all priorities",style: new TextStyle(color: Colors.white,fontSize: 15.0)),
                      color: Colors.green[600],
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  new Container(
                    width: 100.0,
                    height: 50.0,
                    child: new RaisedButton.icon(
                      icon: Icon(Icons.shop,color: Colors.white,),
                      onPressed: gatya,
                      label: new Text("Sale to unlimited customers",style: new TextStyle(color: Colors.white,fontSize: 15.0)),
                      color: Colors.green[600],
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)
                      ),
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  new Container(
                    width: 100.0,
                    height: 50.0,
                    child: new RaisedButton.icon(
                      icon: Icon(Icons.chat,color: Colors.white,),
                      onPressed: gatya,
                      label: new Text("Connect with freinds & family",style: new TextStyle(color: Colors.white,fontSize: 15.0)),
                      color: Colors.green[600],
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)
                      ),
                    ),
                  ),
                  new Padding(
                      padding: new EdgeInsets.only(top: 15.0)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Text("DIMANDER",style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 13.0,color: Colors.cyan[600])),
                      new Text("JUST  DON'T SETTLE FOR LESS",style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 13.0,color: Colors.cyan[600])),
                    ],
                  ),

                  new Divider(color: Colors.cyan[300],height: 30.0,),

                  new Container(
                    width: 100.0,
                    height: 50.0,
                    child: new RaisedButton(
                      onPressed: () => giris(context),
                      child: new Text("Sign in With Google",style: new TextStyle(color: Colors.white),),
                      color: Colors.deepOrange[600],
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
    );
  }

  void gatya(){
    //do nothing
  }




}
