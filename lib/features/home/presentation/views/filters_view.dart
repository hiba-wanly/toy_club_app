import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy_club_app/constant.dart';

class FiltersView extends StatefulWidget {
  const FiltersView({super.key});

  @override
  State<FiltersView> createState() => _FiltersViewState();
}

class _FiltersViewState extends State<FiltersView> {
  double h = 1;
  double w = 1;

  RangeValues _priceRange = const RangeValues(0, 1000);
  bool _inStock = false;
  bool _backOrder = false;

  List<bool> _ageSelections = List.generate(4, (_) => false);
  List<String> _selectedInterests = [];
  List<bool> _selectedPieceCount = List.generate(4, (_) => false);

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    var textDirection = Directionality.of(context);
    print("saaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaddddddddddddddddd");
    print(
        textDirection);
    return Directionality(
      textDirection:textDirection==TextDirection.ltr ? TextDirection.rtl:TextDirection.ltr ,
      child: Scaffold(
        body: Container(
          margin:
              EdgeInsets.only(left: 0.04 * w, right: 0.04 * w, top: 0.015 * h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                "Loana ability".tr,
                style: TextStyle(
                    fontSize: 0.05 * w,
                    fontWeight: FontWeight.w500,
                    fontFamily: Almarai),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // TODO:EXTRACT WIDGET
                  FilterChip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          16.0), // Adjust the corner radius as needed
                      side: BorderSide(
                          style: BorderStyle.none), // Optional border color
                    ),
                    backgroundColor: Color(0xfff8f8f8),
                    selectedColor: Colors.yellow,
                    label: Text(
                      'ability'.tr,
                      style:
                          TextStyle(fontSize: 0.035 * w, fontFamily: Almarai),
                    ),
                    selected: _inStock,
                    onSelected: (bool selected) {
                      setState(() {
                        _inStock = selected;
                        _backOrder = false;
                      });
                    },
                  ),
                  SizedBox(
                    width: w*0.06,
                  ),
                  FilterChip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          16.0), // Adjust the corner radius as needed
                      side: BorderSide(
                          style: BorderStyle.none), // Optional border color
                    ),
                    backgroundColor: Color(0xfff8f8f8),
                    selectedColor: Colors.yellow,
                    label: Text("not ability".tr,
                        style: TextStyle(
                            fontSize: 0.035 * w, fontFamily: Almarai)),
                    selected: _backOrder,
                    onSelected: (bool selected) {
                      setState(() {
                        _backOrder = selected;
                        _inStock = false;
                      });
                    },
                  ),
                ],
              ),
              Text(
                "number of points".tr,
                style: TextStyle(
                    fontSize: 0.05 * w,
                    fontWeight: FontWeight.w500,
                    fontFamily: Almarai),
              ),
              Container(
                height: h * 0.095,
                child: Stack(
                  children: <Widget>[
                    RangeSlider(
                      activeColor: Colors.yellow,
                      inactiveColor: Color(0xfff8f8f8),
                      values: _priceRange,
                      min: 0,
                      max: 1000,
                      divisions: 100,
                      onChanged: (RangeValues values) {
                        setState(() {
                          _priceRange = values;
                        });
                      },
                    ),
                    Positioned(
                      left: 28,
                      bottom:
                          50, // Position should be adjusted based on the slider thumb location
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '\ ${_priceRange.start.round()}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 0.035 * w,
                              fontFamily: Almarai),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 28,
                      bottom:
                          50, // Position should be adjusted based on the slider thumb location
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '\ ${_priceRange.end.round()}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 0.035 * w,
                              fontFamily: Almarai),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "age".tr,
                style: TextStyle(
                    fontSize: 0.05 * w,
                    fontWeight: FontWeight.w500,
                    fontFamily: Almarai),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // TODO:EXTRACT WIDGET
                  FilterChip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          16.0), // Adjust the corner radius as needed
                      side: BorderSide(
                          style: BorderStyle.none), // Optional border color
                    ),
                    backgroundColor: Color(0xfff8f8f8),
                    selectedColor: Colors.yellow,
                    label: Text(
                      '6+',
                      style:
                          TextStyle(fontSize: 0.035 * w, fontFamily: Almarai),
                    ),
                    selected: _ageSelections[0],
                    onSelected: (bool selected) {
                      setState(() {
                        _ageSelections[0] = selected;
                        _ageSelections[1] = false;
                        _ageSelections[2] = false;
                        _ageSelections[3] = false;
                      });
                    },
                  ),
                  FilterChip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          16.0), // Adjust the corner radius as needed
                      side: BorderSide(
                          style: BorderStyle.none), // Optional border color
                    ),
                    backgroundColor: Color(0xfff8f8f8),
                    selectedColor: Colors.yellow,
                    label: Text(
                      '9+',
                      style:
                          TextStyle(fontSize: 0.035 * w, fontFamily: Almarai),
                    ),
                    selected: _ageSelections[1],
                    onSelected: (bool selected) {
                      setState(() {
                        _ageSelections[1] = selected;
                        _ageSelections[0] = false;
                        _ageSelections[2] = false;
                        _ageSelections[3] = false;
                      });
                    },
                  ),
                  FilterChip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          16.0), // Adjust the corner radius as needed
                      side: BorderSide(
                          style: BorderStyle.none), // Optional border color
                    ),
                    backgroundColor: Color(0xfff8f8f8),
                    selectedColor: Colors.yellow,
                    label: Text(
                      '13+',
                      style:
                          TextStyle(fontSize: 0.035 * w, fontFamily: Almarai),
                    ),
                    selected: _ageSelections[2],
                    onSelected: (bool selected) {
                      setState(() {
                        _ageSelections[2] = selected;
                        _ageSelections[1] = false;
                        _ageSelections[0] = false;
                        _ageSelections[3] = false;
                      });
                    },
                  ),
                  FilterChip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          16.0), // Adjust the corner radius as needed
                      side: BorderSide(
                          style: BorderStyle.none), // Optional border color
                    ),
                    backgroundColor: Color(0xfff8f8f8),
                    selectedColor: Colors.yellow,
                    label: Text(
                      '18+',
                      style:
                          TextStyle(fontSize: 0.035 * w, fontFamily: Almarai),
                    ),
                    selected: _ageSelections[3],
                    onSelected: (bool selected) {
                      setState(() {
                        _ageSelections[3] = selected;
                        _ageSelections[1] = false;
                        _ageSelections[2] = false;
                        _ageSelections[0] = false;
                      });
                    },
                  ),
                ],
              ),
              Text(
               "Interest".tr,
                style: TextStyle(
                    fontSize: 0.05 * w,
                    fontWeight: FontWeight.w500,
                    fontFamily: Almarai),
              ),
              Wrap(
                alignment: WrapAlignment.end,
                spacing: w*0.04,
                children: ['حيوانات', 'سيارات', 'أبنية', 'طائرات', 'شاحنات']
                    .map((String interest) {
                  return ChoiceChip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          16.0), // Adjust the corner radius as needed
                      side: BorderSide(
                          style: BorderStyle.none), // Optional border color
                    ),
                    backgroundColor: Color(0xfff8f8f8),
                    selectedColor: Colors.yellow,
                    label: Text(
                      interest,
                      style:
                          TextStyle(fontSize: 0.035 * w, fontFamily: Almarai),
                    ),
                    selected: _selectedInterests.contains(interest),
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          _selectedInterests.add(interest);
                        } else {
                          _selectedInterests.removeWhere((String name) {
                            return name == interest;
                          });
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              Text(
                "number of pieces".tr,
                style: TextStyle(
                    fontSize: 0.05 * w,
                    fontWeight: FontWeight.w500,
                    fontFamily: Almarai),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FilterChip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          16.0), // Adjust the corner radius as needed
                      side: BorderSide(
                          style: BorderStyle.none), // Optional border color
                    ),
                    backgroundColor: Color(0xfff8f8f8),
                    selectedColor: Colors.yellow,
                    label: Text(
                      '400-499',
                      style:
                          TextStyle(fontSize: 0.035 * w, fontFamily: Almarai),
                    ),
                    selected: _selectedPieceCount[0],
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedPieceCount[0] = selected;
                        _selectedPieceCount[1] = false;
                        _selectedPieceCount[2] = false;
                        ;
                      });
                    },
                  ),
                  FilterChip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          16.0), // Adjust the corner radius as needed
                      side: BorderSide(
                          style: BorderStyle.none), // Optional border color
                    ),
                    backgroundColor: Color(0xfff8f8f8),
                    selectedColor: Colors.yellow,
                    label: Text(
                      '500-999',
                      style:
                          TextStyle(fontSize: 0.035 * w, fontFamily: Almarai),
                    ),
                    selected: _selectedPieceCount[1],
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedPieceCount[1] = selected;
                        _selectedPieceCount[0] = false;
                        _selectedPieceCount[2] = false;
                      });
                    },
                  ),
                  FilterChip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          16.0), // Adjust the corner radius as needed
                      side: BorderSide(
                          style: BorderStyle.none), // Optional border color
                    ),
                    backgroundColor: Color(0xfff8f8f8),
                    selectedColor: Colors.yellow,
                    label: Text(
                      '1000+',
                      style:
                          TextStyle(fontSize: 0.035 * w, fontFamily: Almarai),
                    ),
                    selected: _selectedPieceCount[2],
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedPieceCount[2] = selected;
                        _selectedPieceCount[1] = false;
                        _selectedPieceCount[0] = false;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin:
              EdgeInsets.only(left: 0.04 * w, right: 0.04 * w, top: 0.015 * h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.yellow,
                textColor: Colors.black,
                child: Row(
                  children: [
                    Icon(Icons.refresh),
                    Text(
                      "restore".tr,
                      style: TextStyle(
                          fontSize: 0.035 * w,
                          fontWeight: FontWeight.w500,
                          fontFamily: Almarai),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.yellow,
                textColor: Colors.black,
                child: Text(
                  "show".tr +" 44 "+"result".tr,
                  style: TextStyle(
                      fontSize: 0.035 * w,
                      fontWeight: FontWeight.w500,
                      fontFamily: Almarai),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
