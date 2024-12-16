import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class TypeController extends GetxController {
  final isFood = true.obs;
  final isCatering = false.obs;
  Widget build(BuildContext context) {
    return Row(
      children: [
        Gap(15),
        GestureDetector(
          onTap: () {
            isFood.value = true;
            isCatering.value = false;
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
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
                  color: isFood.value
                      ? Color.fromRGBO(99, 24, 175, 1)
                      : Colors.grey,
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
            isCatering.value = true;
            isFood.value = false;
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
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
                  color: isCatering.value
                      ? Color.fromRGBO(99, 24, 175, 1)
                      : Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
