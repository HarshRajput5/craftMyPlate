import 'package:flutter/material.dart';
import 'controller/order_controller.dart';

class OrderReviewScreen extends StatelessWidget {
  const OrderReviewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 246, 251, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Order Review',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card for order details
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Breakfast Edit Row
                    CustomBreakfastEditRow(screenWidth: screenWidth),
                    SizedBox(height: 8.0),

                    //order Details
                    OrderDetailsRow(screenWidth: screenWidth),
                    Divider(
                      height: 32.0,
                      thickness: 1.0,
                      color: Color.fromRGBO(225, 225, 225, 1),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hide selected items',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down,
                              color: Colors.grey[600]),
                        ],
                      ),
                    ),
                    Divider(
                        height: 32.0,
                        thickness: 1.0,
                        color: Color.fromRGBO(225, 225, 225, 1)),
                    //Subtotal Row
                    TotalPriceRow(screenWidth: screenWidth),
                    Row(
                      children: [
                        Text(
                          "Incl. taxes and charges",
                          style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.w300,
                              color: Color.fromRGBO(147, 153, 159, 1)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            //Detailed Checkout container
            child: CustomPaymentCard(
                screenWidth: screenWidth), 
          ),

          Spacer(),

          // Bottom button
          CustomOrderPlaceButton(screenWidth: screenWidth),
        ],
      ),
    );
  }
}
