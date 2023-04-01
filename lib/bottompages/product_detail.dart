import 'package:flutter/material.dart';
import 'package:simple_slider/simple_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FullScreenImagePage extends StatefulWidget {
  final String pic1, pic2, pic3, pic4, pic5, pic6, pic7, pic8, pic9, pic10, cDescribe, cName, cPrice, cLocation, address, cLead, cQuantity, country, ip, nickname, phoneNumber, photoUrl, id, sex, pip, cType,
      cRegion, cNegotiate, cGender, cAge, cCondition, cSize, cMaterial, cColor, cBrand, cShape, cPeriod, cMake, cModel, cTransmission, cBreed, cSubtype, cLevel,
      cSpot, cRound, cParking, cFurnish, cOpenType, cEqupment, cForm, cFormular, cScent, cRoom, cBedroom, cBathroom, cPower, cStone, cSalary, cExperience, cCareer,
      cRequirement, cSquareM, cLoading, cPayType, cFreigh, cTransport, cTone, cColour, cSubType, cInclude, cFastening, cSkinType, cBenefits, cPackage, cPlatform,
      cDestination, cDuration, cGenre, cCaseMaterial, cBandMaterial, cFeatures, cBandColor, cCaseColor, cStyle, cDisplay;
  final DateTime dd;

  FullScreenImagePage(this.pic1, this.pic2, this.pic3, this.pic4, this.pic5, this.pic6, this.pic7, this.pic8, this.pic9, this.pic10, this.cDescribe, this.cName, this.cPrice, this.cLocation, this.address, this.cLead, this.cQuantity, this.country, this.ip, this.nickname,
      this.phoneNumber, this.photoUrl, this.id, this.sex, this.pip, this.dd, this.cType, this.cRegion, this.cNegotiate, this.cGender, this.cAge, this.cCondition, this.cSize, this.cMaterial, this.cColor, this.cBrand, this.cShape,
      this.cPeriod, this.cMake, this.cModel, this.cTransmission, this.cBreed, this.cSubtype, this.cLevel,
      this.cSpot, this.cRound, this.cParking, this.cFurnish, this.cOpenType, this.cEqupment, this.cForm, this.cFormular, this.cScent, this.cRoom, this.cBedroom,
      this.cBathroom, this.cPower, this.cStone, this.cSalary, this.cExperience, this.cCareer,
      this.cRequirement, this.cSquareM, this.cLoading, this.cPayType, this.cFreigh, this.cTransport, this.cTone, this.cColour, this.cSubType, this.cInclude,
      this.cFastening, this.cSkinType, this.cBenefits, this.cPackage, this.cPlatform,
      this.cDestination, this.cDuration, this.cGenre, this.cCaseMaterial, this.cBandMaterial, this.cFeatures, this.cBandColor, this.cCaseColor, this.cStyle, this.cDisplay);

  @override
  _FullScreenImagePageState createState() => _FullScreenImagePageState(pic1, pic2, pic3, pic4, pic5, pic6, pic7, pic8, pic9, pic10, cDescribe, cName, cPrice, cLocation, address, cLead, cQuantity, country, ip, nickname, phoneNumber, photoUrl, id, sex, pip, dd, cType,
      cRegion, cNegotiate, cGender, cAge, cCondition, cSize, cMaterial, cColor, cBrand, cShape, cPeriod, cMake, cModel, cTransmission, cBreed, cSubtype, cLevel,
      cSpot, cRound, cParking, cFurnish, cOpenType, cEqupment, cForm, cFormular, cScent, cRoom, cBedroom, cBathroom, cPower, cStone, cSalary, cExperience, cCareer,
      cRequirement, cSquareM, cLoading, cPayType, cFreigh, cTransport, cTone, cColour, cSubType, cInclude, cFastening, cSkinType, cBenefits, cPackage, cPlatform,
      cDestination, cDuration, cGenre, cCaseMaterial, cBandMaterial, cFeatures, cBandColor, cCaseColor, cStyle, cDisplay);
}

class _FullScreenImagePageState extends State<FullScreenImagePage> with TickerProviderStateMixin {
  final String pic1, pic2, pic3, pic4, pic5, pic6, pic7, pic8, pic9, pic10, cDescribe, cName, cPrice, cLocation, address, cLead, cQuantity, country, ip, nickname, phoneNumber, photoUrl, id, sex, pip, cType,
      cRegion, cNegotiate, cGender, cAge, cCondition, cSize, cMaterial, cColor, cBrand, cShape, cPeriod, cMake, cModel, cTransmission, cBreed, cSubtype, cLevel,
      cSpot, cRound, cParking, cFurnish, cOpenType, cEqupment, cForm, cFormular, cScent, cRoom, cBedroom, cBathroom, cPower, cStone, cSalary, cExperience, cCareer,
      cRequirement, cSquareM, cLoading, cPayType, cFreigh, cTransport, cTone, cColour, cSubType, cInclude, cFastening, cSkinType, cBenefits, cPackage, cPlatform,
      cDestination, cDuration, cGenre, cCaseMaterial, cBandMaterial, cFeatures, cBandColor, cCaseColor, cStyle, cDisplay;
  final DateTime dd;


  _FullScreenImagePageState(this.pic1, this.pic2, this.pic3, this.pic4, this.pic5, this.pic6, this.pic7, this.pic8, this.pic9, this.pic10, this.cDescribe, this.cName, this.cPrice, this.cLocation, this.address, this.cLead, this.cQuantity, this.country, this.ip, this.nickname,
      this.phoneNumber, this.photoUrl, this.id, this.sex, this.pip, this.dd, this.cType, this.cRegion, this.cNegotiate, this.cGender, this.cAge, this.cCondition, this.cSize, this.cMaterial, this.cColor, this.cBrand, this.cShape,
      this.cPeriod, this.cMake, this.cModel, this.cTransmission, this.cBreed, this.cSubtype, this.cLevel,
      this.cSpot, this.cRound, this.cParking, this.cFurnish, this.cOpenType, this.cEqupment, this.cForm, this.cFormular, this.cScent, this.cRoom, this.cBedroom,
      this.cBathroom, this.cPower, this.cStone, this.cSalary, this.cExperience, this.cCareer,
      this.cRequirement, this.cSquareM, this.cLoading, this.cPayType, this.cFreigh, this.cTransport, this.cTone, this.cColour, this.cSubType, this.cInclude,
      this.cFastening, this.cSkinType, this.cBenefits, this.cPackage, this.cPlatform,
      this.cDestination, this.cDuration, this.cGenre, this.cCaseMaterial, this.cBandMaterial, this.cFeatures, this.cBandColor, this.cCaseColor, this.cStyle, this.cDisplay);





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 40.0,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text(
          "PRODUCT DETAIL",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: _buildProductDetailsPage(context),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  _buildProductDetailsPage(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;


    return ListView(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            elevation: 4.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildProductImagesWidgets(),
                _buildProductTitleWidget(),
                SizedBox(height: 12.0),
                _buildPriceWidgets(),
                SizedBox(height: 12.0),
                _buildDivider(screenSize),
                SizedBox(height: 12.0),
                _buildTypeInfoWidget(),
                _buildRegionInfoWidget(),
                _buildGenderInfoWidget(),
                _buildAgeInfoWidget(),
                _buildConditionInfoWidget(),
                _buildSizeInfoWidget(),
                _buildMaterialInfoWidget(),
                _buildColorInfoWidget(),
                _buildBrandInfoWidget(),
                _buildShapeInfoWidget(),
                _buildPeriodInfoWidget(),
                _buildMakeInfoWidget(),
                _buildModelInfoWidget(),
                _buildTransmissionInfoWidget(),
                _buildBreedInfoWidget(),
                _buildSubtypeInfoWidget(),
                _buildLevelInfoWidget(),
                _buildSpotInfoWidget(),
                _buildRoundInfoWidget(),
                _buildParkingInfoWidget(),
                _buildFurnishInfoWidget(),
                _buildOpenTypeInfoWidget(),
                _buildEqupmentInfoWidget(),
                _buildFormInfoWidget(),
                _buildFormularInfoWidget(),
                _buildScentInfoWidget(),
                _buildRoomInfoWidget(),
                _buildBedroomInfoWidget(),
                _buildBathroomInfoWidget(),
                _buildPowerInfoWidget(),
                _buildStoneInfoWidget(),
                _buildSalaryInfoWidget(),
                _buildExperienceInfoWidget(),
                _buildCareerInfoWidget(),
                _buildRequirementsInfoWidget(),
                _buildSquareMInfoWidget(),
                _buildLoadingInfoWidget(),
                _buildPayTypeInfoWidget(),
                _buildFreighInfoWidget(),
                _buildTransportInfoWidget(),
                _buildToneInfoWidget(),
                _buildColourInfoWidget(),
                _buildSubTypeInfoWidget(),
                _buildIncludeInfoWidget(),
                _buildFasteningInfoWidget(),
                _buildSkinTypeInfoWidget(),
                _buildBenefitsInfoWidget(),
                _buildPackageInfoWidget(),
                _buildPlatformInfoWidget(),
                _buildDestinationInfoWidget(),
                _buildDurationInfoWidget(),
                _buildGenreInfoWidget(),
                _buildCaseMaterialInfoWidget(),
                _buildBandMaterialInfoWidget(),
                _buildFeaturesInfoWidget(),
                _buildBandColorInfoWidget(),
                _buildCaseColorInfoWidget(),
                _buildStyleInfoWidget(),
                _buildDisplayInfoWidget(),
                _buildFurtherInfoWidget(),
                SizedBox(height: 12.0),
                _buildDivider(screenSize),
                SizedBox(height: 12.0),
                _buildSizeChartWidgets(),
                SizedBox(height: 12.0),
                _buildDetailsAndMaterialWidgets(),
                SizedBox(height: 12.0),
                _buildStyleNoteHeader(),
                SizedBox(height: 6.0),
                _buildDivider(screenSize),
                SizedBox(height: 4.0),
                _buildStyleNoteData(),
                SizedBox(height: 20.0),
                _buildMoreInfoHeader(),
                SizedBox(height: 6.0),
                _buildDivider(screenSize),
                SizedBox(height: 4.0),
                _buildMoreInfoData(),
                SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _buildDivider(Size screenSize) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey[600],
          width: screenSize.width,
          height: 0.25,
        ),
      ],
    );
  }

  _buildProductImagesWidgets(){
    if (pic1 != null && pic2 != null && pic3 != null &&
        pic4 != null && pic5 != null && pic6 != null &&
        pic7 != null && pic8 != null && pic9 != null &&
        pic10 != null) {
      final _imageUrls = [
        pic1 ?? '',
        pic2 ?? '',
        pic3 ?? '',
        pic4 ?? '',
        pic5 ?? '',
        pic6 ?? '',
        pic7 ?? '',
        pic8 ?? '',
        pic9 ?? '',
        pic10 ?? ''
      ];
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 350.0,
          child: Center(
            child: ImageSliderWidget(
              imageUrls: _imageUrls,
              imageBorderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      );
    }else if (pic1 != null && pic2 != null && pic3 != null &&
        pic4 != null && pic5 != null && pic6 != null &&
        pic7 != null && pic8 != null && pic9 != null &&
        pic10 == null) {
      final _imageUrls = [
        pic1 ?? '',
        pic2 ?? '',
        pic3 ?? '',
        pic4 ?? '',
        pic5 ?? '',
        pic6 ?? '',
        pic7 ?? '',
        pic8 ?? '',
        pic9 ?? ''
      ];
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 350.0,
          child: Center(
            child: ImageSliderWidget(
              imageUrls: _imageUrls,
              imageBorderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      );
    }else if (pic1 != null && pic2 != null && pic3 != null &&
        pic4 != null && pic5 != null && pic6 != null &&
        pic7 != null && pic8 != null && pic9 == null &&
        pic10 == null) {
      final _imageUrls = [
        pic1 ?? '',
        pic2 ?? '',
        pic3 ?? '',
        pic4 ?? '',
        pic5 ?? '',
        pic6 ?? '',
        pic7 ?? '',
        pic8 ?? ''
      ];
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 350.0,
          child: Center(
            child: ImageSliderWidget(
              imageUrls: _imageUrls,
              imageBorderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      );
    }else if (pic1 != null && pic2 != null && pic3 != null &&
        pic4 != null && pic5 != null && pic6 != null &&
        pic7 != null && pic8 == null && pic9 == null &&
        pic10 == null) {
      final _imageUrls = [
        pic1 ?? '',
        pic2 ?? '',
        pic3 ?? '',
        pic4 ?? '',
        pic5 ?? '',
        pic6 ?? '',
        pic7 ?? ''
      ];
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 350.0,
          child: Center(
            child: ImageSliderWidget(
              imageUrls: _imageUrls,
              imageBorderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      );
    }else if (pic1 != null && pic2 != null && pic3 != null &&
        pic4 != null && pic5 != null && pic6 != null &&
        pic7 == null && pic8 == null && pic9 == null &&
        pic10 == null) {
      final _imageUrls = [
        pic1 ?? '',
        pic2 ?? '',
        pic3 ?? '',
        pic4 ?? '',
        pic5 ?? '',
        pic6 ?? ''
      ];
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 350.0,
          child: Center(
            child: ImageSliderWidget(
              imageUrls: _imageUrls,
              imageBorderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      );
    }else if (pic1 != null && pic2 != null && pic3 != null &&
        pic4 != null && pic5 != null && pic6 == null &&
        pic7 == null && pic8 == null && pic9 == null &&
        pic10 == null) {
      final _imageUrls = [
        pic1 ?? '',
        pic2 ?? '',
        pic3 ?? '',
        pic4 ?? '',
        pic5 ?? ''
      ];
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 350.0,
          child: Center(
            child: ImageSliderWidget(
              imageUrls: _imageUrls,
              imageBorderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      );
    }else if (pic1 != null && pic2 != null && pic3 != null &&
        pic4 != null && pic5 == null && pic6 == null &&
        pic7 == null && pic8 == null && pic9 == null &&
        pic10 == null) {
      final _imageUrls = [
        pic1 ?? '',
        pic2 ?? '',
        pic3 ?? '',
        pic4 ?? ''
      ];
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 350.0,
          child: Center(
            child: ImageSliderWidget(
              imageUrls: _imageUrls,
              imageBorderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      );
    }else if (pic1 != null && pic2 != null && pic3 != null &&
        pic4 == null && pic5 == null && pic6 == null &&
        pic7 == null && pic8 == null && pic9 == null &&
        pic10 == null) {
      final _imageUrls = [
        pic1 ?? '',
        pic2 ?? '',
        pic3 ?? ''
      ];
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 350.0,
          child: Center(
            child: ImageSliderWidget(
              imageUrls: _imageUrls,
              imageBorderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      );
    }else if (pic1 != null && pic2 != null && pic3 == null &&
        pic4 == null && pic5 == null && pic6 == null &&
        pic7 == null && pic8 == null && pic9 == null &&
        pic10 == null) {
      final _imageUrls = [
        pic1 ?? '',
        pic2 ?? ''
      ];
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 350.0,
          child: Center(
            child: ImageSliderWidget(
              imageUrls: _imageUrls,
              imageBorderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      );
    }else if (pic1 != null && pic2 == null && pic3 == null &&
        pic4 == null && pic5 == null && pic6 == null &&
        pic7 == null && pic8 == null && pic9 == null &&
        pic10 == null) {
      final _imageUrls = [
        pic1 ?? ''
      ];
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 350.0,
          child: Center(
            child: ImageSliderWidget(
              imageUrls: _imageUrls,
              imageBorderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      );
    }else {
      final _imageUrls = [
        pic1 ?? ''
      ];
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 350.0,
          child: Center(
            child: ImageSliderWidget(
              imageUrls: _imageUrls,
              imageBorderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      );
    }
  }


  _buildProductTitleWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Center(
        child: Text(
          cName,
          style: TextStyle(fontSize: 20.0, color: Colors.grey[500], fontWeight: FontWeight.bold),
        ),
      ),
      );

  }

  _buildPriceWidgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            "Preffered Price",
            style: TextStyle(fontSize: 20.0, color: Colors.black,fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            cPrice,
            style: TextStyle(fontSize: 16.0, color: Colors.grey[500],fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 8.0,
          ),
          Flexible(
          child: Text(
            cNegotiate,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.green,
            ),
            overflow: TextOverflow.ellipsis,
          )
          ),
        ],
      ),
    );
  }

  _buildFurtherInfoWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.share,
            color: Colors.blueAccent,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            "Expected Delivery",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            cLead,
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
          Divider(color: Colors.grey[600],height: 0.25,),
        ],
      ),

    );
  }
  _buildTypeInfoWidget() {
    if (cType != null) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
          Icon(
            Icons.merge_type,
            color: Colors.blueAccent,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            "Type",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            cType ?? '',
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
          ]),
          new Column(
            children: <Widget>[
             new Divider(color: Colors.grey[600],height: 10.0)]
          )
        ],

    ));
  }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }

  _buildRegionInfoWidget() {
    if (cRegion != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.edit_location,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Region",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cRegion ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildGenderInfoWidget() {
    if (cGender != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.wc,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Gender",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cGender ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildAgeInfoWidget() {
    if (cAge != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.leak_add,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Age",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cAge ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildConditionInfoWidget() {
    if (cCondition != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.new_releases,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Condition",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cCondition ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildSizeInfoWidget() {
    if (cSize != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.format_size,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Size",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cSize ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildMaterialInfoWidget() {
    if (cMaterial != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.donut_small,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Material",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cMaterial ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildColorInfoWidget() {
    if (cColor != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.color_lens,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Color",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cColor ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildBrandInfoWidget() {
    if (cBrand != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.branding_watermark,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Brand",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cBrand ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildShapeInfoWidget() {
    if (cShape != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.format_shapes,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Shape",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cShape ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildPeriodInfoWidget() {
    if (cPeriod != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.timer,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Period",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cPeriod ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildMakeInfoWidget() {
    if (cMake != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.image_aspect_ratio,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Make",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cMake ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildModelInfoWidget() {
    if (cModel != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.burst_mode,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Model",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cModel ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildTransmissionInfoWidget() {
    if (cTransmission != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.transform,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Transmission",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cTransmission ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildBreedInfoWidget() {
    if (cBreed != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.blur_on,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Breed",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cBreed ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }_buildSubtypeInfoWidget() {
    if (cSubtype != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.text_fields,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Subtype",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cSubtype ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildLevelInfoWidget() {
    if (cLevel!= null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.layers,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Level",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cLevel ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildSpotInfoWidget() {
    if (cSpot != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.spa,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Spot",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cSpot ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildRoundInfoWidget() {
    if (cRound != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.radio_button_unchecked,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Round",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cRound ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildParkingInfoWidget() {
    if (cParking != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.local_parking,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Parking",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cParking ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildFurnishInfoWidget() {
    if (cFurnish != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.hourglass_full,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Furnished",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cFurnish ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildOpenTypeInfoWidget() {
    if (cOpenType != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.open_with,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Open Type",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cOpenType ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildEqupmentInfoWidget() {
    if (cEqupment != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.pan_tool,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Equipment",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cEqupment ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildFormInfoWidget() {
    if (cForm != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.format_size,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Form",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cForm ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildFormularInfoWidget() {
    if (cFormular != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.graphic_eq,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Formular",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cFormular ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildScentInfoWidget() {
    if (cScent != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.wb_iridescent,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Scent",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cScent ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildRoomInfoWidget() {
    if (cRoom != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.room,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Room",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cRoom ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildBedroomInfoWidget() {
    if (cBedroom != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.airline_seat_individual_suite,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Bedroom",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cBedroom ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildBathroomInfoWidget() {
    if (cBathroom != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.hot_tub,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Bathroom",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cBathroom ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildPowerInfoWidget() {
    if (cPower != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.power,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Power",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cPower ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildStoneInfoWidget() {
    if (cStone != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.bubble_chart,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Stone",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cStone ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildSalaryInfoWidget() {
    if (cSalary != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.credit_card,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Salary",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cSalary ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildExperienceInfoWidget() {
    if (cExperience != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.exposure,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Experience",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cExperience ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildCareerInfoWidget() {
    if (cCareer != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.group_work,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Career",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cCareer ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildRequirementsInfoWidget() {
    if (cRequirement != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.note_add,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Requirements",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cRequirement ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildSquareMInfoWidget() {
    if (cSquareM != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.crop_square,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Square Meters",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cSquareM ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildLoadingInfoWidget() {
    if (cLoading != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.power_input,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Loading",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cLoading ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildPayTypeInfoWidget() {
    if (cPayType != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.payment,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Pay Type",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cPayType ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildFreighInfoWidget() {
    if (cFreigh != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.transit_enterexit,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Freigh",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cFreigh ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildTransportInfoWidget() {
    if (cTransport != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.directions_transit,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Transport",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cTransport ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildToneInfoWidget() {
    if (cTone != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.tonality,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Tone",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cTone ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildColourInfoWidget() {
    if (cColour != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.color_lens,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Colour",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cColour ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildSubTypeInfoWidget() {
    if (cSubType != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.text_fields,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Sub Type",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cSubType ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildIncludeInfoWidget() {
    if (cInclude != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.all_inclusive,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Include",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cInclude ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildFasteningInfoWidget() {
    if (cFastening != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.threesixty,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Fastening",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cFastening ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildSkinTypeInfoWidget() {
    if (cSkinType != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.adjust,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Skin Type",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cSkinType ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildBenefitsInfoWidget() {
    if (cBenefits != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.check_circle_outline,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Benefits",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cBenefits ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildPackageInfoWidget() {
    if (cPackage != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.view_compact,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Package",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cPackage ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildPlatformInfoWidget() {
    if (cPlatform != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.format_quote,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Platform",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cPlatform ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildDestinationInfoWidget() {
    if (cDestination != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.my_location,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Destination",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cDestination ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildDurationInfoWidget() {
    if (cDuration != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.timer,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Duration",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cDuration ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildGenreInfoWidget() {
    if (cGenre != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.library_music,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Genre",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cGenre ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildCaseMaterialInfoWidget() {
    if (cCaseMaterial != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.menu,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Case Material",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cCaseMaterial ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildBandMaterialInfoWidget() {
    if (cBandMaterial != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.menu,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Band Material",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cBandMaterial ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildFeaturesInfoWidget() {
    if (cFeatures != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.featured_play_list,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Features",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cFeatures ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildBandColorInfoWidget() {
    if (cBandColor != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.color_lens,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Band Color",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cBandColor ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildCaseColorInfoWidget() {
    if (cCaseColor != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.color_lens,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Case Color",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cCaseColor ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildStyleInfoWidget() {
    if (cStyle != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.style,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Style",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cStyle ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }
  _buildDisplayInfoWidget() {
    if (cDisplay != null) {
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[
              new Row(
                  children: <Widget>[
                    Icon(
                      Icons.watch,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Display",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      cDisplay ?? '',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ]),
              new Column(
                  children: <Widget>[
                    new Divider(color: Colors.grey[600],height: 10.0)]
              )
            ],

          ));
    }else {
      return Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: 0,
            height: 0,
          ),
        ],
      );
    }
  }




  _buildSizeChartWidgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.calendar_today,
            color: Colors.blueAccent,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            "Posted on",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            "$dd",
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }

  _buildDetailsAndMaterialWidgets() {
    TabController tabController = new TabController(length: 2, vsync: this);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TabBar(
            controller: tabController,
            tabs: <Widget>[
              Tab(
                child: Text(
                  "DETAILS",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "DEMANDER'S DETAILS",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            height: 60.0,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                Text(
                  cDescribe,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                Text(
                  "NAME: $nickname\n\nLocation: $cLocation",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildStyleNoteHeader() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
      ),
      child: Text(
        "PHONE NUMBER/CONTACT",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  _buildStyleNoteData() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
      ),
      child: Text(
        phoneNumber == null
            ? "Number unavailable"
            : phoneNumber ?? '',
        style: TextStyle(
          color: Colors.grey[600],
        ),
      ),
    );
  }

  _buildMoreInfoHeader() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
      ),
      child: Text(
        "ADDRESS",
        style: TextStyle(
          color: Colors.grey[800],
        ),
      ),
    );
  }

  _buildMoreInfoData() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
      ),
      child: Text(
        address.isEmpty
            ? "Address unavailable"
            : address ?? '',
        style: TextStyle(
          color: Colors.grey[600],
        ),
      ),
    );
  }

  _buildBottomNavigationBar() {
    soil(){
      Firestore.instance.collection("users").document(id).collection("savedPosts").document(pip).setData(
          {
            'id': ip,
            'photoUrl': photoUrl,
            'nickname': nickname,
            'counrty': country,
            'address': address,
            'phoneNumber': phoneNumber,
            'sex': sex,
            'cName': cName,
            'cDescribe': cDescribe,
            'cQuantity': cQuantity,
            'cLead': cLead,
            'cLocation': cLocation,
            'cPrice': cPrice,
            'timestamp': DateTime.now().millisecondsSinceEpoch,
            'pic1': pic1,
            'pic2': pic2,
            'pic3': pic3,
            'pic4': pic4,
            'pic5': pic5,
            'pic6': pic6,
            'pic7': pic7,
            'pic8': pic8,
            'pic9': pic9,
            'pic10': pic10,
          });
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: RaisedButton(
              onPressed: soil(),
              color: Colors.grey,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.list,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      "SAVE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: RaisedButton(
              onPressed: () {},
              color: Colors.greenAccent,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.card_travel,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      "REMOVE FROM BAG",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }



}