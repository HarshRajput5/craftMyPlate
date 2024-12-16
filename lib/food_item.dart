import 'package:craft_my_plate/controller/veg_non_veg_row.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'controller/breakfast_page_controller.dart';

class FoodSelectionScreen extends StatelessWidget {
  const FoodSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(

      // Main Screen
      body: ResponsiveFoodSelection(), 

      //Bottom Navigation Section
      bottomNavigationBar: BreakfastBottomNav(screenWidth: screenWidth),

      //Add ons Floating Button
      floatingActionButton: CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Stack(
        clipBehavior: Clip.none, // Allows positioning outside bounds
        alignment: Alignment.center, 
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 3), 
                ),
              ],
            ),
            child: Text(
              'Add Ons',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          
          // Circular icon floating on top
          Positioned(
            top: -15, 
            right: -15, 
            child: Container(
              decoration: BoxDecoration(
                color: Colors.pink, 
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.add,
                size: 20,
                color: Colors.white, // Icon color
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResponsiveFoodSelection extends StatefulWidget {
  const ResponsiveFoodSelection({super.key});

  @override
  State<ResponsiveFoodSelection> createState() =>
      _ResponsiveFoodSelectionState();
}

class _ResponsiveFoodSelectionState extends State<ResponsiveFoodSelection> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLargeScreen = size.width > 600;
    final screenWidth = MediaQuery.of(context).size.width;
    final controller = ValueNotifier<bool>(false);

    return Column(
      children: [
        Gap(30),

        //AppBar
        BreakfastCustomAppBar(),

        Container(
          height: 1,
          width: double.maxFinite,
          color: Colors.grey,
        ),
        Expanded(
          child: Row(
            children: [

              //Left Navigation section
              BreakfastCustomLeftNav(screenWidth: screenWidth),

              Column(
                children: [
                  Expanded(
                    child: Container(
                      width: 1,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    Gap(10),

                    //Veg Non-Veg Selection Section
                    VegNonVegRow(
                      screenWidth: screenWidth,
                      controller: controller,
                    ),

                    Gap(10),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    
                    // Food Items Grid
                    DisplayDishes(isLargeScreen: isLargeScreen),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
