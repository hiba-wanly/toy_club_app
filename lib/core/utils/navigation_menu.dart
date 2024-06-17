import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:toy_club_app/features/home/presentation/views/home_view.dart';
import 'package:toy_club_app/features/orders/presentation/views/orders_view.dart';
import 'package:toy_club_app/features/profile/presentation/views/profile_view.dart';
import 'package:toy_club_app/features/favorite/presentation/views/wishlist_view.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: Colors.white,
          height: 60,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined,color:Color(0x88939292)),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.cases_outlined,color:Color(0x88939292)),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.heart,color:Color(0x88939292)),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_2_outlined,color:Color(0x88939292)),
              label: '',
            ),
          ],
        ),
      ),
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomeView(),
    OrdersView(),
    WishlistView(),
    ProfileView()
  ];
}
