import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:craft_my_plate/type_selection_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'controller/food_service_type.dart';
import 'controller/home_page_food_controller.dart';
import 'package:flutter/services.dart';


void main() {
   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Locks the app to portrait mode
  ]).then((_) {
    runApp(const WeddingApp());
  });
}

class WeddingApp extends StatelessWidget {
  const WeddingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeddingScreen(),
    );
  }
}

// ignore: must_be_immutable
class WeddingScreen extends StatelessWidget {
  const WeddingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TypeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FoodServiceType(
                controller:
                    controller), //Bulk Food Delivery or Catering Service
            _buildCategorySelector(context), //TabBar Section
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySelector(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      width: double.maxFinite,
      height: 650,
      child: ContainedTabBarView(
        tabBarProperties: TabBarProperties(
            indicatorColor: Colors.red,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.grey,
            labelPadding: EdgeInsets.all(0)),
        tabs: [
          Text('All (8)'), //TabBar Item
          Text('Breakfast'), //TabBar Item
          Text('Lunch&Dinner'), //TabBar Item
          Text('Snacks'), //TabBar Item
        ],
        views: [
          SingleChildScrollView(
            child: HomeFoodItemList(
                screenWidth: screenWidth), //TabBar Selection Widget
          ),
          SingleChildScrollView(
            child: HomeFoodItemList(
                screenWidth: screenWidth), //TabBar Selection Widget
          ),
          SingleChildScrollView(
            child: HomeFoodItemList(
                screenWidth: screenWidth), //TabBar Selection Widget
          ),
          SingleChildScrollView(
            child: HomeFoodItemList(
                screenWidth: screenWidth), //TabBar Selection Widget
          ),
        ],
      ),
    );
  }

  // ignore: unused_element
  Widget _buildCategory(String text, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: () {},
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.pink : Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class HomeFoodItemList extends StatelessWidget {
  const HomeFoodItemList({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Gap(10),
            HomePageFoodController(screenWidth: screenWidth), //Food Item
            Gap(20),
            HomePageFoodController(screenWidth: screenWidth), //Food Item
            Gap(20),
            HomePageFoodController(screenWidth: screenWidth), //Food Item
          ],
        ),
      ),
    );
  }
}
