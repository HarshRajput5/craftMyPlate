import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'food_list.dart';

class FoodCard extends StatelessWidget {
  final FoodItem foodItem;

  const FoodCard({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              //Food Image
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  foodItem.imageUrl,
                ),
              ),
              Positioned(
                top: 93,
                left: 8,
                child: foodItem.isVeg
                    ? Image.asset("images/Veg.png")
                    : Image.asset("images/nonVeg.png"),
              ),
            ],
          ),
          Gap(10),
          Padding(
            padding: const EdgeInsets.only(left:8.0,right: 8),
            child: Row(
              children: [
                Text(foodItem.name, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Gap(30),
          Padding(
            padding: const EdgeInsets.only(left:8.0,right: 8,bottom: 8),
            child: GestureDetector(
              onTap: () {
                if (foodItem.added) {
                  foodItem.added = false;
                } else if (!foodItem.added) {
                  foodItem.added = true;
                }
              },
              child: Container(
                width: double.maxFinite,
                height: screenWidth * 0.075,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink),
                    borderRadius: BorderRadius.circular(5),
                    color: foodItem.added ? Colors.pink : Colors.white),
                child: Center(
                  child: Text(
                    foodItem.added?
                    "Added" : "Add",
                    style: TextStyle(
                        color: foodItem.added ? Colors.white : Colors.pink,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ),
          Gap(10),
        ],
      ),
    );
  }
}
