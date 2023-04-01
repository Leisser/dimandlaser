import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dimand/pages/dimpo.dart';


void main() => runApp(new PageTwo());

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage();
  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  static final GlobalKey<ScaffoldState> scaffoldKey =
  new GlobalKey<ScaffoldState>();

  TextEditingController _searchQuery;
  bool _isSearching = false;
  String searchQuery = "Search query";

  @override
  void initState() {
    super.initState();
  }

  dumper() async{
    _searchQuery = new TextEditingController();
    await pop();
  }

  pop() async {
    if(searchQuery == 'hairPinLeft'){
      print('get');
    }else{
      print('got');
    }
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
    });
  }
  dim(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new Dirty()),
    );
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
            const Text('Seach box'),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return new Row(
    children: [
      new TextField(
      controller: _searchQuery,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
        hintStyle: const TextStyle(color: Colors.white30),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: updateSearchQuery,
    )
    ]);
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
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      key: scaffoldKey,
      appBar: new AppBar(
        leading: _isSearching ? const BackButton() : null,
        title: _isSearching ? _buildSearchField() : _buildTitle(context),
        actions: _buildActions(),
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: new RaisedButton(
                onPressed: dim,
                child: new Text('CLICK HERE TO POST WHAT YOU WANT TO BUY',style: new TextStyle(color: Colors.white),),
                color: Colors.black,
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
            new Text(
              '$searchQuery',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
  }
}