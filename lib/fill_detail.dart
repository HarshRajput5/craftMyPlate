// ignore_for_file: non_constant_identifier_names

import 'package:craft_my_plate/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'controller/fill_details_controller.dart';

class FillDetailsPage extends StatefulWidget {
  const FillDetailsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FillDetailsPageState createState() => _FillDetailsPageState();
}

class _FillDetailsPageState extends State<FillDetailsPage> {
  String occasion = "Birthday";

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 246, 251, 1),
      appBar: CustomAppBar(screenWidth),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset("images/Vector.png"),
                SizedBox(width: 8),
                Text(
                  "South Indian Breakfast",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.edit_square, color: Colors.grey),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Occasion",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(147, 153, 159, 1)),
                              ),
                              Gap(10),

                              // Occasion Selection Dropdown Button
                              CustomDropDown(screenWidth),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "Date and Time",
                                style: TextStyle(
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Gap(10),

                          //DateTime Selection Row
                          CustomDateTimeRow(context),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          // Discount percentage and price row
                          PricePerPlateRow(
                            screenWidth: screenWidth,
                          ),

                          //Guest selection row
                          Obx(
                            () => GuestSelectionRow(screenWidth),
                          ),

                          //Guest Selection by slider
                          controller.GuestSelectionSlider(),

                          Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text('10(min)'), Text("1500")],
                            ),
                          ),
                          Gap(30),
                          Row(
                            children: [
                              Text(
                                "\u{2728} DYNAMIC PRICING",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                " more guests, more savings.",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          Gap(20),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Spacer(),

            //Order Review Button
            OrderReviewButton()
          ],
        ),
      ),
    );
  }
  
  Row GuestSelectionRow(double screenWidth) {
    return Row(
      children: [
        Text(
          "Total Guests",
          style: TextStyle(
              fontSize: screenWidth * 0.04, fontWeight: FontWeight.w400),
        ),
        Spacer(),
        IconButton(
          icon: Icon(Icons.remove, color: Colors.purple),
          onPressed: () {
            setState(() {
              if (controller.guest.value > 10) controller.guest.value--;
            });
          },
        ),
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                controller.guest.value.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.add, color: Colors.purple),
          onPressed: () {
            setState(() {
              if (controller.guest.value < controller.maxGuest.value) {
                controller.guest.value++;
              }
            });
          },
        ),
      ],
    );
  }

  Row CustomDateTimeRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => controller.selectDate(context),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.purple),
                  Gap(10),
                  Text(
                    controller.customDate(),
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: GestureDetector(
            onTap: () => controller.selectTime(context),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.access_time, color: Colors.purple),
                  Gap(10),
                  Obx(()=>Text(
                    controller.formattedTime,
                    style: TextStyle(fontSize: 16),
                  ),)
                  
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  SizedBox CustomDropDown(double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.6,
      child: DropdownButton<String>(
        value: occasion,
        isExpanded: true,
        items: ["Birthday", "Wedding", "Anniversary"].map((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            occasion = newValue!;
          });
        },
        underline: Container(),
      ),
    );
  }

  AppBar CustomAppBar(double screenWidth) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        "Fill Details",
        style: TextStyle(
            fontSize: screenWidth * 0.045,
            color: Colors.black,
            fontWeight: FontWeight.w500),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_circle_left,
          size: 30,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      centerTitle: true,
    );
  }
}
