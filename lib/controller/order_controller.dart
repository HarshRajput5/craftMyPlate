import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'controller.dart';

class CustomOrderPlaceButton extends StatelessWidget {
  const CustomOrderPlaceButton({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    return Container(
      color: Colors.white,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.only(left:15.0,right: 15,top: 10,bottom: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'To pay',
                  style: TextStyle(
                    fontSize: screenWidth * 0.039,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '₹${controller.discountedTotalPrice()}',//Discounted total price
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(99,24,175,1),
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: screenWidth * 0.1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Text(
                'Place Order',
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomPaymentCard extends StatelessWidget {
  const CustomPaymentCard({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(151, 101, 202, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    '🥳 Hurray! You saved',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  Text(
                    ' ₹${controller.discount()} ',//Discounted amount
                    style: TextStyle(
                      color: Color.fromRGBO(239,179,26,1),
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  Text(
                    'on total order',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  Text(
                    '₹${controller.totalAmount()}',//Total amount
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dynamic pricing discount ✨',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  Text(
                    '-₹${controller.discount()}',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(72,76,81,1)
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Divider(height: 32.0, thickness: 1.0,color: Color.fromRGBO(225,225,225,1)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'To Pay',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '₹${controller.discountedTotalPrice()}',//Discounted amount
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Gap(10)
          ],
        ),
      ),
    );
  }
}

class TotalPriceRow extends StatelessWidget {
  const TotalPriceRow({
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
          'Subtotal',
          style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w500),
        ),
        Gap(10),
        Text(
          '₹${controller.guest.value*controller.maxPricePerPlate.value}',
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
            color: Colors.grey,
            fontSize: screenWidth * 0.035,
          ),
        ),
        Gap(10),
        Text(
          '₹${controller.guest.value*controller.pricePerPlate.value}', //total amount
          style: TextStyle(
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class OrderDetailsRow extends StatelessWidget {
  const OrderDetailsRow({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    return Row(
      children: [
        Icon(Icons.person, size: screenWidth * 0.04),
        SizedBox(width: 4.0),
        Text(controller.guest.string),//number of guest
        SizedBox(width: 16.0),
        Icon(Icons.calendar_today, size: screenWidth * 0.04),
        SizedBox(width: 4.0),
        Text(controller.customDate()),//date
        SizedBox(width: 16.0),
        Icon(Icons.access_time, size: screenWidth * 0.04),
        SizedBox(width: 4.0),
        Text('${controller.formattedTime} - 02:30'),//time
      ],
    );
  }
}

class CustomBreakfastEditRow extends StatelessWidget {
  const CustomBreakfastEditRow({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset("images/Vector.png"),
            Gap(10),
            Text(
              'Millet Breakfast',
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text('Edit',
              style: TextStyle(
                color: Color.fromRGBO(237, 69, 150, 1),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              )),
        ),
      ],
    );
  }
}

