// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax_flutter/iconsax_flutter.dart';
//
// class TAppBar extends StatefulWidget implements PreferredSizeWidget {
//   const TAppBar(
//       {super.key,
//       this.title,
//        this.showBackArrow=true,
//       this.leadingIcon,
//       this.actions,
//       this.leadingOnPressed});
//
//   final Widget? title;
//   final bool showBackArrow;
//   final IconData? leadingIcon;
//   final List<Widget>? actions;
//   final VoidCallback? leadingOnPressed;
//
//   @override
//   State<TAppBar> createState() => _TAppBarState();
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => throw UnimplementedError();
// }
//
// class _TAppBarState extends State<TAppBar> {
//   double h = 1;
//   double w = 1;
//   @override
//   Widget build(BuildContext context) {
//     h = MediaQuery.of(context).size.height;
//     w = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 0.3),
//       child: AppBar(
//         automaticallyImplyLeading: false,
//         leading: widget.showBackArrow
//             ? IconButton(
//                 onPressed: () => Get.back(), icon: Icon(Iconsax.arrow_left))
//             : widget.leadingIcon != null ? IconButton(onPressed: widget.leadingOnPressed, icon: Icon(widget.leadingIcon)) : null,
//       title: widget.title,
//         actions: widget.actions,
//
//       ),
//     );
//   }
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => Size.fromHeight(h*0.04);
// }
