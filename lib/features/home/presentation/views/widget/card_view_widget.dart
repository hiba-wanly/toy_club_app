import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy_club_app/constant.dart';
import 'package:toy_club_app/features/home/data/models/toys_model.dart';
import 'package:toy_club_app/features/home/presentation/views/details_view.dart';

class GridViewToyItem extends StatefulWidget {
   List<Toys> toy;
   GridViewToyItem({super.key, required this.toy});

  @override
  State<GridViewToyItem> createState() => _GridViewToyItemState();
}

class _GridViewToyItemState extends State<GridViewToyItem> {
  double h = 1;
  double w = 1;

  @override
  Widget build(BuildContext context) {
    var textDirection = Directionality.of(context);
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: (w / (h / 1.7))),
        // shrinkWrap: true,
        physics:  const NeverScrollableScrollPhysics(),
        itemCount: widget.toy.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, index) {
          return InkWell(
            onTap: () {
                  Get.to(DetailsView( toy : widget.toy[index]));
            },
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 5,
              margin: EdgeInsets.only(
                // top: h * 0.0000001,
                bottom: h * 0.03,
                left: w * 0.04,
                right: w * 0.04,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              child: Stack(alignment: Alignment.center, children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/img.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                    right:textDirection==TextDirection.rtl ? w * 0.03 : null,
                    left:textDirection==TextDirection.rtl ?  null:  w * 0.03 ,
                    top: h * 0.015,
                    child: Text(
                      widget.toy[index].sub_brand,
                      style:
                          TextStyle(
                              color: Colors.white, fontFamily: Almarai,fontWeight: FontWeight.w600),
                    )),
                Positioned(
                    right:textDirection==TextDirection.rtl ? w * 0.03 : null,
                    left:textDirection==TextDirection.rtl ?  null:  w * 0.03,
                    bottom: 20,
                    // top:100,
                    child: Opacity(
                      opacity: 0.9,
                      child: Container(
                        padding:
                            EdgeInsets.
                        symmetric(
                            horizontal: textDirection==TextDirection.rtl ? w*0.01 : w*0.008 ,

                            vertical: h*0.005),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius:BorderRadius.circular(18)
                        ),
                        child: Text(
                          widget.toy[index].required_points,
                          style:
                              TextStyle(color: Colors.white, fontFamily: Almarai,fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
              ]),
            ),
          );
        });
  }
}
