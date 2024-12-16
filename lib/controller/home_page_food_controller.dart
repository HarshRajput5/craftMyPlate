import 'package:craft_my_plate/food_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomePageFoodController extends StatelessWidget {
  const HomePageFoodController({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image Section
          CustomImage(screenWidth: screenWidth),
          // Dish Name
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Indian Soiree",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gap(10),
                Divider(),
                Text(
                  "7 Categories & 12 Items",
                  style: TextStyle(
                      color: Color.fromRGBO(220, 104, 3, 1),
                      fontWeight: FontWeight.w500),
                ),

                CustomFoodCategory(), //Food Item List
                Divider(),
                CustomizeFoodRow(
                    screenWidth:
                        screenWidth), //Food Price And Customize section
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomizeFoodRow extends StatelessWidget {
  const CustomizeFoodRow({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Food Price
                Text(
                  "₹299",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "/guest",
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Add guest count to see ",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Dynamic Price",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(99, 24, 175, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        Gap(5),
        //Customize Button
        GestureDetector(
          onTap: () {
            Get.to(() => FoodSelectionScreen());
          },
          child: Container(
            height: 40,
            width: 115,
            decoration: BoxDecoration(
                color: Color.fromRGBO(99, 24, 175, 1),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Customize",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 15,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CustomFoodCategory extends StatelessWidget {
  const CustomFoodCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      //Food Items Name
      child: Row(
        children: [
          FoodCategory(
            label: "2 Starter",
          ),
          Gap(15),
          FoodCategory(
            label: "1 Mains",
          ),
          Gap(15),
          FoodCategory(
            label: "3 Drinks",
          ),
          Gap(15),
          FoodCategory(
            label: "2 Starter",
          ),
          Gap(15),
          FoodCategory(
            label: "2 Starter",
          ),
          Gap(15),
          FoodCategory(
            label: "2 Starter",
          ),
          Gap(15),
          FoodCategory(
            label: "2 Starter",
          ),
        ],
      ),
    );
  }
}

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          child: Image.asset(
            "images/panner.png", // Add your food image here
            width: screenWidth,
            height: 180,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 15,
          // left: 1,
          child: Container(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                color: Colors.purple,
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(163, 0, 163, 1),
                    Color.fromRGBO(11, 0, 61, 1)
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )),
            child: const Text(
              "Best for 🍛 Pooja",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                color: const Color.fromARGB(187, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                )),
            child: Row(
              children: [
                Icon(Icons.person),
                const Text(
                  " Min 10-Max 120",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class FoodCategory extends StatelessWidget {
  FoodCategory({super.key, required this.label});
  String label;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenWidth * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "images/biryani.png",
            scale: 0.7,
          ),
          Text(label)
        ],
      ),
    );
  }
}
