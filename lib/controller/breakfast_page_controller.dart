import 'package:craft_my_plate/fill_detail.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'food_item.dart';
import 'food_list.dart';
import 'left_menu_item.dart';

class DisplayDishes extends StatelessWidget {
  const DisplayDishes({
    super.key,
    required this.isLargeScreen,
  });

  final bool isLargeScreen;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.maxFinite,
        color: Color.fromRGBO(245, 246, 251, 1),
        child: GridView.builder(
          //GridView for display food items
          padding: const EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isLargeScreen ? 4 : 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 14,
            childAspectRatio: 0.6,
          ),
          itemCount: foodItems.length,
          itemBuilder: (context, index) {
            final foodItem = foodItems[index];
            return FoodCard(foodItem: foodItem); //Food Items
          },
        ),
      ),
    );
  }
}

class BreakfastBottomNav extends StatelessWidget {
  const BreakfastBottomNav({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Container(
        color: Colors.white,
        width: double.maxFinite,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price per plate',
                  style: TextStyle(
                    fontSize: screenWidth * 0.039,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '₹240',
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '/Plate',
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Navigation Button
            ElevatedButton(
              onPressed: () {
                Get.to(() => FillDetailsPage());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(99, 24, 175, 1),
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: screenWidth * 0.1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Text(
                'Fill Details',
                style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BreakfastCustomLeftNav extends StatelessWidget {
  const BreakfastCustomLeftNav({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),

      // Menu Item List
      child: Column(
        children: [
          LeftMenuItem(
              screenWidth: screenWidth,
              isTrue: true,
              label: "Starters",
              item: "2/2",
              image: "images/samosa.png"),
          Gap(20),
          LeftMenuItem2(
              screenWidth: screenWidth,
              isTrue: false,
              label: "Mains",
              item: "2/2",
              image: "images/biryani.png"),
          Gap(20),
          LeftMenuItem(
              screenWidth: screenWidth,
              isTrue: false,
              label: "Sweets",
              item: "0/1",
              image: "images/sweet.png")
        ],
      ),
    );
  }
}

class BreakfastCustomAppBar extends StatelessWidget {
  const BreakfastCustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Gap(10),
          IconButton(
            icon: Icon(
              Icons.arrow_circle_left,
              size: 30,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          Gap(10),
          const Text(
            "South Indian Breakfast",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Gap(20),
          Icon(Icons.edit_square, color: Colors.grey),
        ],
      ),
    );
  }
}
