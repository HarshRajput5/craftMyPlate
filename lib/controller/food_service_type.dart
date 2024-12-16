import 'package:craft_my_plate/type_selection_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class FoodServiceType extends StatelessWidget {
  const FoodServiceType({
    super.key,
    required this.controller,
  });

  final TypeController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage("images/WeddingImage.png"), // Wedding Image
              fit: BoxFit.cover,
            ),
          ),
        ),
        //Bulk Food Delivery
        Positioned( 
          top: 162,
          width: double.maxFinite,
          child: Obx(
            () => Row(
              children: [
                Gap(15),
                GestureDetector(
                  onTap: () {
                    controller.isFood.value = true;
                    controller.isCatering.value = false;
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: controller.isFood.value
                          ? Colors.white
                          : const Color.fromARGB(255, 213, 212, 212),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Text(
                        "Bulk Food Delivery",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: controller.isFood.value
                              ? Color.fromRGBO(99, 24, 175, 1)
                              : const Color.fromARGB(255, 86, 85, 85),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(20),
                GestureDetector(
                  onTap: () {
                    controller.isCatering.value = true;
                    controller.isFood.value = false;
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: controller.isCatering.value
                          ? Colors.white
                          : const Color.fromARGB(255, 213, 212, 212),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Text(
                        "Catering Service",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: controller.isCatering.value
                              ? Color.fromRGBO(99, 24, 175, 1)
                              : const Color.fromARGB(255, 86, 85, 85),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        
        //Catering Service
        Positioned(
          top: 50,
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              Gap(100),
              Text("Wedding",style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
        )
      ],
    );
  }
}
