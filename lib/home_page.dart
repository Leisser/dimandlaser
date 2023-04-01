import 'package:flutter/material.dart';
import 'package:dimand/auth.dart';
import 'package:dimand/auth_provider.dart';
import 'package:dimand/pages/fab_bottom_app_bar.dart';
import 'package:dimand/pages/fab_with_icons.dart';
import 'package:dimand/pages/layout.dart';
import 'package:dimand/pages/fixed.dart';
import 'package:dimand/bottompages/first.dart';
import 'package:dimand/bottompages/second.dart';
import 'package:dimand/bottompages/third.dart';
import 'package:dimand/bottompages/fourth.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.onSignedOut, }) : super(key: key);
  final VoidCallback onSignedOut;



  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<void> _signOut(BuildContext context) async {
    try {
      final BaseAuth auth = AuthProvider.of(context).auth;
      await auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  static _dockedFabLocation(context) {
    if (MediaQuery.of(context).viewInsets.bottom != 0) {
      return FixedCenterDockedFabLocation(bottomDistance: MediaQuery.of(context).viewInsets.bottom);
    } else {
      return FloatingActionButtonLocation.centerDocked;
    }
  }



  void _selectedFab(int index) {
    _showDialog();
  }
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Do you want to logout?"),
          content: new Text("Accepting this will automatically sign you out."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("CLOSE"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("ACCEPT"),
              onPressed: () {
                Navigator.of(context).pop();
                _signOut(context);
              },
            ),
          ],
        );
      },
    );
  }

  int i =0;
  var page =[
    new PageOne(),
    new PageTwo(),
    new PageThree(),
    new EditProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[i],
      bottomNavigationBar: FABBottomAppBar(
      centerItemText: 'dimand',
      color: Colors.white,
      selectedColor: Colors.green,
      notchedShape: CircularNotchedRectangle(),
      onTabSelected: (index) {setState(() {i = index;});
      },
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      items: [
        FABBottomAppBarItem(iconData: Icons.add_shopping_cart, text: 'Demand'),
        FABBottomAppBarItem(iconData: Icons.business_center, text: 'Sell'),
        FABBottomAppBarItem(iconData: Icons.chat, text: 'Chat'),
        FABBottomAppBarItem(iconData: Icons.settings, text: 'Settings'),
      ],
    ),
      floatingActionButtonLocation: _dockedFabLocation(context),
      floatingActionButton: _buildFab(
          context), // This trailing comma makes auto-formatting nicer for build methods.

    );
  }
  Widget _buildFab(BuildContext context) {
    final icons = [Icons.power_settings_new ];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset, ) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0,),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: _selectedFab,
        ),

        );
      },
      child: FloatingActionButton(
        onPressed: () { },
        tooltip: 'Increment',
        child: Icon(Icons.add,),
        elevation: 2.0,
      ),
    );
  }
}
