import 'package:flutter/material.dart';
import 'package:toy_club_app/constant.dart';
class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  double h = 1;
  double w = 1;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      body:   Flexible(
          child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                // final bool isSelected = index == selectedIdx;
                return InkWell(
                  onLongPress: (){
                    setState(() {
                      // selectedIdx=isSelected?null :index;
                      // items.removeAt(index);
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      // top: h * 0.0000001,
                      bottom: h * 0.03,
                      left: w * 0.04,
                      right: w * 0.04,
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            AppImagesAssets.welcomeImg,
                            fit: BoxFit.cover,
                            height:h*0.09,
                            width:w*0.18,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        SizedBox(width: w*0.05,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('اسم اللعبة', style: TextStyle(fontSize: w*0.05, fontWeight: FontWeight.bold,color: Color(0x88282827),)),
                            Text('الفئة + رقم القطعة', style: TextStyle(fontSize: w*0.04,color: Color(0x88282827),)),
                            Text('التقييم ', style: TextStyle(fontSize: w*0.03,color: Color(0x88282827),)),
                          ],
                        ),
                        SizedBox(width: w*0.15,),
                        // Container(
                        //   decoration: isSelected? BoxDecoration(
                        //     border: Border.all(color: Colors.red,width:w*0.03),
                        //     borderRadius: BorderRadius.circular(8)
                        //   ):BoxDecoration(),
                        // )

                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  Divider(
                    color: Color(0xffeeeded),
                    height: h * 0.1,
                    thickness: 2,
                  ),
              itemCount: 10)),
    );
  }
}
