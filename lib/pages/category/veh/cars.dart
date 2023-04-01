import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mock_data/mock_data.dart';
import 'package:dimand/bottompages/first.dart';
import 'package:dimand/mydropdown.dart' as MyDropdown;
import 'package:dimand/pages/picloads/carpic.dart';


class Cars extends StatefulWidget {
  @override
  _DimpostState createState() => _DimpostState();
}

class _DimpostState extends State<Cars> {
  @override
  Widget build(BuildContext context) => new Scaffold(
    resizeToAvoidBottomPadding: false,
    appBar: AppBar(
      leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){Navigator.pop(context);}),
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text('Satisfy Your Dimand'),
    ),
    body: new DimPostScreen(),
  );
}

class DimPostScreen extends StatefulWidget{
  DimPostScreen({Key key,}) : super(key: key);

  State createState() => new DimPostScreenState();

}

class DimPostScreenState extends State<DimPostScreen> {
  SharedPreferences prefs;
  String cName, id, photoUrl, nickName, country, phoneNumber, address,
      cQuantity, cPrice, cLocation, cDescribe, sex, cMake, cRegion, cNegotiate,cModel,cTransmission;
  bool _load = false;
  String _bolt = '';
  String category = 'Vehicles';
  String subcategory = 'Cars';

  _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2030)
    );
    if(picked != null) setState(() => _bolt = picked.toString());
  }

  checkMe() async {
    if (cName != null && cQuantity != null && cPrice != null &&
        cLocation != null && cDescribe != null
        && cNegotiate != null && cRegion != null && cMake != null && _bolt != null && cTransmission != null && cModel != null) {
      await prefs.setString('cName', cName);
      await prefs.setString('cDescribe', cDescribe);
      await prefs.setString('cQuantity', cQuantity);
      await prefs.setString('cLocation', cLocation);
      await prefs.setString('cPrice', cPrice);
      await prefs.setString('_bolt', _bolt);
      await prefs.setString('cRegion',cRegion);
      await prefs.setString('cNegotiate',cNegotiate);
      await prefs.setString('cMake',cMake);
      await prefs.setString('cModel', cModel);
      await prefs.setString('cTransmission', cTransmission);
      await pickOn();
    } else {
      Fluttertoast.showToast(msg: "FILL ALL FIELDS");
    }
  }



  Future<void> pickOn() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new CarPic()),
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
    // Force refresh input
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    readLocal();
  }

  final TextStyle textstyle =
  TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  final InputDecoration decoration = InputDecoration(
    border: OutlineInputBorder(),
  );

  void handleUpdateDim() {
    setState((){
      _load = true;
    });
    if (cName != null && cQuantity != null && cPrice != null &&
        cLocation != null && cDescribe != null
        && cNegotiate != null && cRegion != null && cMake != null && _bolt != null && cTransmission != null && cModel != null) {
      String docName;
      docName = mockString(50);

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
            'cLocation': cLocation,
            'cPrice': cPrice,
            'cLead': _bolt,
            'cMake': cMake,
            'cRegion': cRegion,
            'cNegotiate': cNegotiate,
            'category': category,
            'subcategory': subcategory,
            'cModel':cModel,
            'cTransmissio':cTransmission,
            'timestamp': DateTime.now().millisecondsSinceEpoch,
          });
      dim();
      Fluttertoast.showToast(msg: "Update success");

    }else {
      Fluttertoast.showToast(msg: "FILL ALL FIELDS");
    }
  }

  dim(){
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => PageOne()),
          (Route<dynamic> route) => false,
    );

  }


  @override
  Widget build(BuildContext context) {
    Widget loadingIndicator =_load? new Container(
      color: Colors.orange[300],
      width: 70.0,
      height: 70.0,
      child: new Padding(padding: const EdgeInsets.all(5.0),child: new Center(child: new CircularProgressIndicator())),
    ):new Container();

    Widget clot () {
      if (cMake== 'Toyota') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose The Model'),
          value: cModel,
          items: <String>[
            '1000', '4- Runner', 'Allex', 'Allion', 'Alphard', 'Alleza', 'Aristo', 'Avalon' ,'Avanza' ,'Avenis' ,'Avensis' ,'Aygo' ,'Bb' ,
            'Belta' ,'Blade' 'Blizzard' ,'Brevis' ,'Caldina' ,'Cami' ,'Camry' ,'Carib' ,'Carina' 'Celica' 'Celsior' ,'Chaser' ,'C-HR' ,
            'Coaster' ,'Condor' ,'Conquest' ,'Corolla' ,'Corona' ,'Corsa' ,'Cressida' ,'Cresta' ,'Crown' ,'Cynos' ,'Denso' ,'Duet' ,'Dyna' ,
            'Echo' ,'Es' ,'Estima' ,'Fchv' ,'Fielder' ,'Fj Cruiser' ,'Fk' ,'Fortuner' ,'Fun Cargo' ,'Fxs' ,'Gaia' ,'Grand Hiace' ,'Granvia' ,
            'Gt1' ,'Harrier' ,'Hiace' ,'High Lander' ,'Hilux' ,'Ipsum' ,'Isis' ,'Ist' ,'Kluger' ,'Land Cruiser' ,'Land Cruiser Prado' ,
            'Lexcen' ,'Lite-Ace' ,'Mark II' ,'Mark X' ,'Master' ,'Matrix' ,'Mr2' ,'Mr-S' ,'Nadia' ,'Noah' ,'Opa' ,'Paseo' ,'Passo' ,'Picnic' ,
            'Plat 2' ,'Pod' ,'Porte' ,'Premio' ,'Previa' ,'Prius' ,'Probox' ,'Progress' ,'Publica' ,'Quantum' ,'Ractis  ' ,'Raum' ,'Rav4' ,
            'Regius Van' ,'Retro' ,'Rsc' ,'Run-X' ,'Rush' ,'Sa' ,'Scion' ,'Sequoia' ,'Sera' ,'Sienna' ,'Sienta' ,'Soarer' ,'Solara' ,'Spacio' ,
            'Sparkey' ,'Sprinter' ,'Stallion' ,'Starlet' ,'Succeed' ,'Supra' ,'Surf' ,'T100' ,'Tacoma' ,'Tazz' ,'Tercel' ,'Townace' ,'TRD' ,
            'Tundra' ,'Vanguard' ,'Vellfire' ,'Venture' ,'Venza' ,'Verossa' ,'Vios' ,'Vista' ,'Voltz' ,'Voxy' ,'Will' ,'Windom' ,'Wish' ,'Xyr' ,
            'Yaris' ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      } else if (cMake == 'Honda') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose The Model'),
          value: cModel,
          items: <String>[
            '1300' ,'919' ,'Accord' ,'Accord Cross Tour' ,'Acty' ,'ANF' ,'Ape' ,'Avancier' ,'Ax-1' ,'Ballade' ,'Benly' ,'Big' ,
            'CA' ,'Lapa' ,'CB' ,'CBR' ,'CD' ,'CG' ,'CH' ,'City' ,'Civic' ,'CJ' ,'CL' ,'CM' ,'CN' ,'Concerto' ,'CR' ,'599' ,'Crea' ,
            'CRF' ,'CRM' ,'Cross Road' ,'CR-V' ,'CRX' ,'CR-2' ,'CT' ,'CX' ,'Deauville' ,'Dio' ,'DN-01' ,'Dream' ,'Dylan' ,'Element' ,
            'Elite' ,'Elysion' ,'Express' ,'F' ,'FES' ,'Fit' ,'FJR' ,'FMX' ,'Foresight' ,'Forza' ,'Focu Trax' ,'FR-V' ,'FSC' ,
            'FT' ,'Fuya' ,'GB' ,'GC' ,'Goldwing' ,'Gorilla' ,'H' ,'Helix' ,'HR-V' ,'Insight' ,'Interceptor' ,'Jazz' ,'Head' ,
            'Hegend' ,'Hife' ,'Magna'  ,'MB5' ,'Millenium' ,'Mobilio' ,'Monkey' ,'MT' ,'Mtx' ,'Ns' ,'Nsr' ,'Nsx' ,'Nt' ,'Ntv' ,
            'Nx' ,'Odyssey' ,'Pantheon' ,'Passport' ,'Pc' ,'Pilot' ,'Prelude' ,'Ps' ,'Px50' ,'Quintet' ,'RC' ,'Rebel' ,'Ridgeline' ,
            'Ruckus' ,'RVF' ,'RVT' ,'S2000' ,'S500' ,'S-600' ,'S-800' ,'SCV' ,'SFX' ,'SH' ,'Shadow' ,'Shuttle' ,'Silver Wing' ,'Sky' ,
            'SL' ,'SLR' ,'Smart' ,'S-Mx' ,'Ssm' ,'St' ,'Steed' ,'Step Wagon' ,'Stream' ,'SW-T400' ,'That' ,'Tiger' ,'TL' ,'Today' ,
            'Torneo' ,'TRXV65' ,'Vamos' ,'VFR' ,'Vigor' ,'VT' ,'VTX' ,'X4' ,'XBR' ,'XL' ,'XR' ,'Z' ,'Z50R' ,'Zoomer' ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      } else if (cMake == 'Nissan') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Model'),
          value: cModel,
          items: <String>[
            '100' ,'1400' ,'200sx' ,'240sx' ,'260z' ,'300zx' ,'350z' ,'370z' ,'Advan' ,'Almera' ,'Altima' ,'Armada' ,'Atlas' ,'Avenir' ,'Basara' ,
            'Blue Bird' ,'Cabstar' ,'Caravan' ,'Carina' ,'Cedric' ,'Cefiro' ,'Cherry' ,'Cima' ,'Civilian' ,'Commercial' ,'Crew' ,'Cube' ,
            'Doublecab' ,'Dualis' ,'E20' ,'Tlgrand' ,'Fairlady' ,'FB14' ,'FB15' ,'Frontier' ,'Fuga' ,'Fusion' ,'Gloria' ,'Grand' ,'GT-R' ,
            'Hard Body' ,'Hyper Mini' ,'Ideo' ,'Interstar' ,'Juke' ,'Latesta' ,'Micra' ,'Laurel' ,'Leaf' ,'Leopard' ,'Liberty' ,'Livira' ,'March' ,
            'Maxima' ,'Moco' ,'Murano' ,'Navara' ,'Note' ,'NP300' ,'Pathfinder' ,'Patrol' ,'Pick-Up' ,'Pintara' ,'Platina' ,'Prairie' ,'Presage' ,
            'Presea' ,'President' ,'Primaster' ,'Primera' ,'Pulsar' ,'Qashai' ,'Quest' ,'Rasheen' ,'Roque' ,'Santana' ,'Sentra' ,'Serena' ,
            'Silvia' ,'Skyline' ,'Stagea' ,'Stanza' ,'Sunny' ,'Teona' ,'Terrano' ,'Tiida' ,'Titan' ,'Trail Runner' ,'UA-QG' ,'UD' ,'Urban' ,
            'Vanette' ,'Versa' ,'Violet' ,'Wing Road' ,'X Terra' ,'X-Trail' ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      } else if (cMake == 'Mercedes-Benz') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Model'),
          value: cModel,
          items: <String>[
            '1113' ,'1117' ,'1420' ,'1422' ,'1619' ,'1622' ,'1722' ,'1733' ,'1820' ,'1824' ,'1827' ,'190' ,'190E' ,'1922' ,'1927' ,'200' ,'200E' ,
            '2024' ,'220' ,'220E' ,'2422' ,'2524' ,'2527' ,'260E' ,'280E' ,'300D' ,'300E' ,'300TE' ,'500SE' ,'A-Class' ,'Actros' ,'Atego' ,'Avor' ,
            'B-Class' ,'C43' ,'C63' ,'C180' ,'C200' ,'C220' ,'C230' ,'C240' ,'C250' ,'C270' ,'C280' ,'C300' ,'C320' ,'C350' ,'C400' ,'Citaro' ,
            'Cito' ,'CL' ,'CLA-Class' ,'CLC' ,'CLK' ,'CLS' ,'Conecto' ,'E200' ,'E220' ,'E230' ,'E240' ,'E250' ,'E280' ,'E300' ,'E320' ,'E350' ,
            'E420' ,'E430' ,'E500' ,'Ess' ,'E550' ,'E63' ,'G-Class' ,'GLK-Class' ,'GLS-Class' ,'GLE-Class' ,'GLC-Class' ,'CLA-Class' ,'Intergo' ,
            'Intouro' ,'MB100' ,'M Class' ,'Portor' ,'R-Class' ,'SC-Class' ,'S-Class' ,'Sl-Class Mirage''1113' ,'1117' ,'1420' ,'1422' ,'1619' ,
            '1622' ,'1722' ,'1733' ,'1820' ,'1824' ,'1827' ,'190' ,'190E' ,'1922' ,'1927' ,'200' ,'200E' ,'2024' ,'220' ,'220E' ,'2422' ,'2524' ,
            '2527' ,'260E' ,'280E' ,'300D' ,'300E' ,'300TE' ,'500SE' ,'A-Class' ,'Actros' ,'Atego' ,'Avor' ,'B-Class' ,'C43' ,'C63' ,'C180' ,
            'C200' ,'C220' ,'C230' ,'C240' ,'C250' ,'C270' ,'C280' ,'C300' ,'C320' ,'C350' ,'C400' ,'Citaro' ,'Cito' ,'CL' ,'CLA-Class' ,'CLC' ,
            'CLK' ,'CLS' ,'Conecto' ,'E200' ,'E220' ,'E230' ,'E240' ,'E250' ,'E280' ,'E300' ,'E320' ,'E350' ,'E420' ,'E430' ,'E500' ,'Ess' ,'E550' ,
            'E63' ,'G-Class' ,'GLK-Class' ,'GLS-Class' ,'GLE-Class' ,'GLC-Class' ,'CLA-Class' ,'Intergo' ,'Intouro' ,'MB100' ,'M Class' ,'Portor' ,
            'R-Class' ,'SC-Class' ,'S-Class' ,'Sl-Class Mirage', 'SLK Class', 'SLR Class', 'Sprinter', 'T1', 'T2', 'TN', 'Tourismo', 'Travego',
            'Vaneo', 'Viano', 'Vito'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Volkswagen') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Infiniti') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Mitsubishi') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Land Rover') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Peugeot') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      } else if (cMake == 'Ford') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Acura') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Alfa Romeo') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Aprilia') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Aston Martin') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Audi') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Bajaj') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'BAW') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Bentley') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Blue Bird') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      } else if (cMake == 'BMW') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Bomag') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Brilliance') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Buick') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Cadillac') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Changan') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Chery') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Chevrolet') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Chrysler') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Citroen') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Daewoo') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'DAF') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Daihatsu') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Daimler') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Datsun') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Dodge') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }
      else if (cMake == 'Ferrari') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Fiat') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Foton') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Freightliner') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Geely') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Ginaf') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'GMC') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Gonow') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'GrandTiger') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Haima') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Higer') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Hino') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Hummer') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Hyundai') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }
      else if (cMake == 'Isuzu') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Iveco') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'IVM') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'JAC') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Jaguar') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Jeep') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Jin Bei') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Jincheng') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'JMC') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Joylong') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Kia') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Lada') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Lamborghini') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Lancia') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'LDV') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Lexus') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Leyland') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Lifan') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Lincoln') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Lotus') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Mack') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Mahindra') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Man') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Maserati') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Mazda') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'McLaren') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Mercury') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'MG') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Mini') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Oldsmobile') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Opel') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Polaris') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Pontiac') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Porsche') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Proton') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Renault') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Rolls-Royce') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Rover') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Saab') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Samsung') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Sany') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Saturn') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Scania') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Seat') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Simba') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Skoda') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'SkyGo') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'SMA') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Smart') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'SsangYong') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Subaru') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Suzuki') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Tata') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'T King') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Triumph') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'TVS') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Vauxhall') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Vector') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Venturi') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Volvo') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Yutong') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Zoomlion') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Zotye') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      }else if (cMake == 'Other Make') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cModel,
          items: <String>[
            'Other'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cModel = newValue;
            });
          },
        );
      } else {
        return null;
      }
    }
    Widget plot () {
      if (cRegion == 'Central Region') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cLocation,
          items: <String>[
            'Kalangala','Kampala', 'Kayunga', 'Kiboga','Luwero', 'Masaka', 'Mpigi','Mubende','Mukono','Nakasongola','Sembabule','Wakiso']
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cLocation = newValue;
            });
          },
        );
      } else if (cRegion == 'Northern Region') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cLocation,
          items: <String>[
            'Adjumani','Apac','Arua', 'Gulu', 'Kitgum', 'Kotido','Lira','Moroto','Nakapiripirit','Nebbi','Yumbe']
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cLocation = newValue;
            });
          },
        );
      } else if (cRegion == 'Eastern Region') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cLocation,
          items: <String>[
            'Bugiri','Busia','Iganga','Jinja','Kaberamaindo','Kamuli','Kapchorwa','Katakwi','Kumi','Mayuge','Mbale', 'Palisa', 'Soroti', 'Tororo']
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cLocation = newValue;
            });
          },
        );
      } else if (cRegion == 'Western Region') {
        return new MyDropdown.DropdownButton(
          hint: new Text('Choose Your Location'),
          value: cLocation,
          items: <String>[
            'Bushenyi',
            'Hoima',
            'Kabale',
            'Kabarole',
            'Kamwenge',
            'Kanungu',
            'Kasese',
            'Kibale',
            'Kisoro',
            'Kyenyoyo',
            'Masindi',
            'Mbarara',
            'Ntugamo',
            'Rukungi'
          ]
              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
            return MyDropdown.DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              cLocation = newValue;
            });
          },
        );
      } else {
        return null;
      }
    }

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(

              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    verticalDirection: VerticalDirection.down,


                    children: <Widget>[
                      new Align(child: loadingIndicator,alignment: FractionalOffset.center,),
                      new Container(
                        child: new Text(
                          'Name',
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black),
                        ),
                        margin: new EdgeInsets.only(
                            left: 10.0, bottom: 5.0, top: 10.0),
                        alignment: Alignment.bottomLeft,
                      ),
                      new Container(
                        child: new TextField(
                          decoration: new InputDecoration(
                              hintText: 'Name of the commodity',
                              border: new UnderlineInputBorder(),
                              contentPadding: new EdgeInsets.all(5.0),
                              hintStyle: new TextStyle(color: Colors.grey)),
                          onChanged: (value) {
                            cName = value;
                          },
                        ),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Divider(color: Colors.white,height: 20.0,),
                      new Container(
                        child: new Text(
                          'Make',
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black),
                        ),
                        margin: new EdgeInsets.only(
                            left: 10.0, bottom: 5.0, top: 10.0),
                        alignment: Alignment.bottomLeft,
                      ),
                      new Container(
                        child: new MyDropdown.DropdownButton(
                          hint: new Text('Choose the make'),
                          value: cMake,
                          items: <String>['Toyota', 'Honda', 'Nissan', 'Mercedes-Benz', 'Volkswagen', 'Mitsubishi','Land Rover', 'Peugeot', 'Ford',
                          'Acura','Alfa Romeo','Aprilia','Aston Martin','Audi','Bajaj','BAW','Bently','Blue Bird','BMW','Brilliance',
                          'Buick','Cadillac','Changan','Chery', 'Chevrolet','Chrysler','Citroen', 'Daewoo','DAF','Daihatsu','Daimler','Datsun','Dodge','Ferrari',
                          'Fiat', 'Foton', 'Freightliner','Geely','Ginaf','GMC','Gonow','GrandTiger', 'Haima', 'Higer', 'Hino', 'Hummer',
                          'Hyundai', 'Isuzu', 'Iveco', 'IVM', 'JAC','Jaguar','Jeep', 'Jin Bei', 'Jincheng', 'JMC', 'Joylong', 'Kia','Lada','Lamborghini','Lancia', 'LDV', 'Lexus',
                          'Leyland', 'Lifan','Lincoln','Lotus', 'Mack', 'Mahindra', 'Man','Maserati', 'Mazda', 'McLaren',
                          'Mercury', 'MG','Mini','Oldsmobile', 'Opel', 'Polaris', 'Pontiac','Porsche', 'Proton', 'Renault','Rolls-Royce', 'Rover','Saab', 'Samsung', 'Sany', 'Saturn',
                          'Scania', 'Seat', 'Simba', 'Skoda', 'SkyGo', 'SMA', 'Smart', 'SsangYong','Subaru', 'Suzuki', 'Tata', 'T king','Triumph', 'TVS',
                          'Vauxhall','Vector', 'Venturi', 'Volvo', 'Yutong', 'Zoomlion', 'Zotye', 'Other Make']
                              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
                            return MyDropdown.DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              cMake = newValue;
                            });
                          },
                        ),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Container(
                        child: new Text(
                          'Model',
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black),
                        ),
                        margin: new EdgeInsets.only(
                            left: 10.0, bottom: 5.0, top: 10.0),
                        alignment: Alignment.bottomLeft,
                      ),
                      new Container(
                        child: clot(),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Divider(color: Colors.white,height: 20.0,),
                      new Container(
                        child: new Text(
                          'Select Region',
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black),
                        ),
                        margin: new EdgeInsets.only(
                            left: 10.0, bottom: 5.0, top: 10.0),
                        alignment: Alignment.bottomLeft,
                      ),
                      new Container(
                        child: new MyDropdown.DropdownButton(
                          hint: new Text('Choose Your Region'),
                          value: cRegion,
                          items: <String>['Central Region', 'Eastern Region', 'Northern Region', 'Western Region']
                              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
                            return MyDropdown.DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              cRegion = newValue;
                            });
                          },
                        ),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Divider(color: Colors.white,height: 20.0,),
                      new Container(
                        child: new Text(
                          'Dercription',
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black),
                        ),
                        margin: new EdgeInsets.only(
                            left: 10.0, bottom: 5.0, top: 10.0),
                        alignment: Alignment.bottomLeft,
                      ),
                      new Container(
                        child: new TextField(
                          decoration: new InputDecoration(
                              hintText: 'Black, Android 8, HD camera etc.',
                              border: new UnderlineInputBorder(),
                              contentPadding: new EdgeInsets.all(5.0),
                              hintStyle: new TextStyle(color: Colors.grey)),
                          onChanged: (value) {
                            cDescribe = value;
                          },
                        ),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Divider(color: Colors.white,height: 20.0,),
                      new Container(
                        child: new Text(
                          'Quantity',
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black),
                        ),
                        margin: new EdgeInsets.only(
                            left: 10.0, bottom: 5.0, top: 10.0),
                        alignment: Alignment.bottomLeft,
                      ),
                      new Container(
                        child: new TextField(
                          decoration: new InputDecoration(
                              hintText: '3 pieces',
                              border: new UnderlineInputBorder(),
                              contentPadding: new EdgeInsets.all(5.0),
                              hintStyle: new TextStyle(color: Colors.grey)),
                          onChanged: (value) {
                            cQuantity = value;
                          },
                        ),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Divider(color: Colors.white,height: 20.0,),
                      new Container(
                        child: new Text(
                          'Your location',
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black),
                        ),
                        margin: new EdgeInsets.only(
                            left: 10.0, bottom: 5.0, top: 10.0),
                        alignment: Alignment.bottomLeft,
                      ),
                      new Container(
                        child: plot(),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Divider(color: Colors.white,height: 20.0,),
                      new Container(
                        child: new Text(
                          'Preffered date/time of delivery or pickup',
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black),
                        ),
                        margin: new EdgeInsets.only(
                            left: 10.0, bottom: 5.0, top: 10.0),
                        alignment: Alignment.bottomLeft,
                      ),
                      new Container(
                        padding: new EdgeInsets.all(5.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Text(_bolt, style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),),
                            new RaisedButton(onPressed: _selectDate, child: new Text('Click To Set Date',style: textstyle,),shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)
                            ), color: Colors.green, )
                          ],
                        ),
                      ),
                      new Container(
                        child: new Text(
                          'Transmission',
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black),
                        ),
                        margin: new EdgeInsets.only(
                            left: 10.0, bottom: 5.0, top: 10.0),
                        alignment: Alignment.bottomLeft,
                      ),
                      new Container(
                        child: new MyDropdown.DropdownButton(
                          hint: new Text('Select Transmission'),
                          value: cTransmission,
                          items: <String>['Automatic', 'Manual']
                              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
                            return MyDropdown.DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              cTransmission = newValue;
                            });
                          },
                        ),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Divider(color: Colors.white,height: 20.0,),
                      new Container(
                        child: new Text(
                          'Preffered Price',
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black),
                        ),
                        margin: new EdgeInsets.only(
                            left: 10.0, bottom: 5.0, top: 10.0),
                        alignment: Alignment.bottomLeft,
                      ),
                      new Container(
                        child: new TextField(
                          decoration: new InputDecoration(
                              hintText: '250000 (Shillings Only)',
                              border: new UnderlineInputBorder(),
                              contentPadding: new EdgeInsets.all(5.0),
                              hintStyle: new TextStyle(color: Colors.grey)),
                          onChanged: (value) {
                            cPrice = value;
                          },
                        ),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Divider(color: Colors.white,height: 20.0,),
                      new Container(
                        child: new Text(
                          'Negotiable',
                          style: new TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: Colors.black),
                        ),
                        margin: new EdgeInsets.only(
                            left: 10.0, bottom: 5.0, top: 10.0),
                        alignment: Alignment.bottomLeft,
                      ),
                      new Container(
                        child: new MyDropdown.DropdownButton(
                          hint: new Text('Are You Price Flexible'),
                          value: cNegotiate,
                          items: <String>['Negotiable', 'Nonnegotiable']
                              .map<MyDropdown.DropdownMenuItem<String>>((String value) {
                            return MyDropdown.DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              cNegotiate = newValue;
                            });
                          },
                        ),
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                      ),
                      new Divider(color: Colors.white,height: 20.0,),

                      new Container(
                        margin: new EdgeInsets.only(left: 30.0, right: 30.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[
                            new Container(
                              child: RaisedButton(
                                color: Colors.green,
                                child: Text("ADD IMAGES", style: textstyle,),
                                onPressed: checkMe,
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0)
                                ),
                              ),

                            ),
                            new Container(
                              child: RaisedButton(
                                color: Colors.orange,
                                child: Text("UPLOAD POST", style: textstyle,),
                                onPressed: handleUpdateDim,
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
              )
          );
        }
    );
  }

}


