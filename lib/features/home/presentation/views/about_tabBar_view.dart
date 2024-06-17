

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/core/widgets/primary_header_container.dart';

class AboutTabBar extends StatefulWidget {
  const AboutTabBar({super.key});

  @override
  State<AboutTabBar> createState() => _AboutTabBarState();
}

class _AboutTabBarState extends State<AboutTabBar> {
  double h = 1;
  double w = 1;
  final int availability=0;
  late final PageController pageController;
  int pageNumber =0;
   Timer? carasoulTimer;
  Timer getTimer(){
    return Timer.periodic(const Duration(seconds: 3),
            (timer) {
                if(pageNumber==5){
                  pageNumber=0;
                }
                pageController.animateToPage(pageNumber,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInCirc);
                pageNumber++;
            });
  }

  @override
  void initState() {
    pageController=PageController(
      initialPage: 0,
      viewportFraction: 0.85
    );
    carasoulTimer=getTimer();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          SizedBox(
            height: h*0.31,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (index){
                pageNumber=index;
                setState(() {

                });
              },
              itemBuilder: (_,index){
              return AnimatedBuilder(
                  animation: pageController,
                  builder: (context,child){
                    return child!;
                  },
              child: GestureDetector(
                onTap: (){

                },
                onPanDown: (d){
                  carasoulTimer?.cancel();
                  carasoulTimer=null;
                },
                onPanCancel: (){
                  carasoulTimer=getTimer();
                },
                child: Container(
                  margin: EdgeInsets.only(
                    top: h*0.03,
                    bottom:  h*0.03,
                    left:  w*0.05,
                    // right:  w*0.02,
                  ),
                  height: h*0.03,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color:  Colors.grey,
                  ),
                ),
              ),
              );
            },
            itemCount: 5,),
          ),
          // SizedBox(height: h*0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:List.generate(5, (index) => Container(
              margin: EdgeInsets.all(2),
              child: Icon(Icons.circle,size: w*0.02,
              color: pageNumber==index? Colors.indigoAccent : Colors.grey.shade300,),
            ))
          ),
          SizedBox(height: h*0.02,),
          Text("لعبة تركيب البناء",style: TextStyle(
              fontSize: 0.05 * w,
              fontWeight: FontWeight.w500,
              fontFamily: Almarai,
              color: Color(0x88282827),
          ),),
          SizedBox(height: h*0.02,),
          Text("77"+" نقطة ",style: TextStyle(
            fontSize: 0.035 * w,
            fontWeight: FontWeight.w500,
            fontFamily: Almarai,
            color: Colors.black,
          ),),
          SizedBox(height: h*0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // This will space out the sections evenly across the main axis
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('4.6', style: TextStyle(fontSize: w*0.035, fontWeight: FontWeight.bold,color: Color(0x88282827),)),
                  Text('التقييم', style: TextStyle(fontSize: w*0.03,color: Color(0x88282827),)),
                ],
              ),
              Column(
                children: <Widget>[
                  Text('830', style: TextStyle(fontSize: w*0.035, fontWeight: FontWeight.bold,color: Color(0x88282827),)),
                  Text('عدد القطع', style: TextStyle(fontSize: w*0.03,color: Color(0x88282827),)),
                ],
              ),
              Column(
                children: <Widget>[
                  Text('10+', style: TextStyle(fontSize: w*0.035, fontWeight: FontWeight.bold,color: Color(0x88282827),)),
                  Text('العمر', style: TextStyle(fontSize: w*0.03,color: Color(0x88282827),)),
                ],
              ),
              Column(
                children: <Widget>[
                  Text('#42123', style: TextStyle(fontSize: w*0.035, fontWeight: FontWeight.bold,color: Color(0x88282827),)),
                  Text('رقم القطعة', style: TextStyle(fontSize: w*0.03,color: Color(0x88282827),)),
                ],
              ),
            ],
          ),
          SizedBox(height:  h*0.02,),
          Expanded(
            child: SingleChildScrollView(
              padding:  EdgeInsets.only(left: 0.05 * w, right: 0.05 * w),
              child: Text("ttttttttttt"
                  "\nuuuuuuuuuuuuuuuuuuu"
                  "\njjjjjjjjjjjjjjj"
                  "\nhhhhhhhhhhhhhhhhhh"
                  "\nttttttttttttttttttttttt"
                  "\neeeeeeeeeeeeeeeeeeeeeeeeee"
                  "\neeeeeeeeeeeeeeeeeeeeeee"
                  "\neeeeeeeeeeeeeeeeeeeeee"
                  "dddddddddddddddddddddddddddd"
                  "\nddddddddddddddddddddd"
                  "\nddddddddddddddddddddddddddddddd"
                  "ddddddddddddddddddddddddddddddddddd"
                  "dddddddddddddddddddddddddddddd"
                  "\nhhhhhhhhhhhhhhhhhsdhsdsdsdsd"
                  "\nttttttttttttttttttttttt"
                  "\neeeeeeeeeeeeeeeeeeeeeeeeee"
                  "\neeeeeeeeeeeeeeeeeeeeeee"
                  "\neeeeeeeeeeeeeeeeeeeeee"
                  "dddddddddddddddddddddddddddd"
                  "\nddddddddddddddddddddd"
                  "\nddddddddddddddddddddddddddddddd"
                  "ddddddddddddddddddddddddddddddddddd"
                  "dddddddddddddddddddddddddddddd"
                  "\nhhhhhhhhhhhhhhhhhsdhsdsdsdsd",
              style: TextStyle(
                fontFamily: Almarai,
                fontSize: w*0.04,
                color: Color(0x88282827),
              ),),

            ),

          ),


        ],
      ),
      bottomNavigationBar:  Container(

        margin:
        EdgeInsets.only(bottom: w*0.04,left: 0.04 * w, right: 0.04 * w, top: 0.015 * h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: availability==0? Color(0xfff8f8f8) : Colors.yellow,
              // Colors.yellow,.
              textColor: Colors.black,
              child: Text(
                'اللعبة متاحة ,احجز الأن !  ',
                style: TextStyle(
                    fontSize: 0.035 * w,
                    fontWeight: FontWeight.w500,
                    fontFamily: Almarai),
              ),
            ),
            MaterialButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
               color: availability==0? Color(0xfff8f8f8) : Colors.yellow,
              textColor: Colors.black,
              child: Text(
                "غير متاحة حالياً",
                style: TextStyle(
                    fontSize: 0.035 * w,
                    fontWeight: FontWeight.w500,
                    fontFamily: Almarai),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
