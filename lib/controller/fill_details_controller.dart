import 'package:craft_my_plate/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

// ignore: must_be_immutable
class OrderReviewButton extends StatelessWidget {
  const OrderReviewButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Get.to(()=>OrderReviewScreen());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(99, 24, 175, 1),
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          "Order Review",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}

class PricePerPlateRow extends StatelessWidget {
  const PricePerPlateRow({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    return Row(
      children: [
        Text(
          "Price Per Plate:",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Spacer(),
        Obx(()=>Text(
          "${controller.percentage.value}%",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),),
        
        Icon(
          Icons.arrow_downward_outlined,
          size: screenWidth * 0.04,
        ),
        Text(
          "\u{20B9}299 ",
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
            color: Colors.grey,
          ),
        ),
        Obx(()=>Text(
          "\u{20B9}${controller.pricePerPlate.value}",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),)
        
      ],
    );
  }
}
