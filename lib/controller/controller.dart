import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Controller extends GetxController {
  final guest = 10.obs;
  final pricePerPlate = 189.obs;
  final maxGuest = 1500.obs;
  final minGuest = 10.obs;
  final maxPricePerPlate = 299.obs;
  final minPricePerPlate = 189.obs;
  final discountValue = 0.obs;
  final total = 0.obs;
  final discountTotal = 0.obs;
  final newPricePerPlate = 0.obs;
  final percentage = 0.obs;
  final selectedDate = Rx<DateTime>(DateTime.now());
  final selectedTime = Rx<TimeOfDay>(TimeOfDay.now());

  void updatedPrice() {
    pricePerPlate.value = (minPricePerPlate.value +
            ((maxPricePerPlate.value - minPricePerPlate.value) *
                    (maxGuest.value - guest.value)) /
                (maxGuest.value - minGuest.value))
        .toInt();
  }

  int discount() {
    discountValue.value = (guest.value * maxPricePerPlate.value) -
        (guest.value * pricePerPlate.value);
    return discountValue.value;
  }

  int totalAmount() {
    total.value = guest.value * maxPricePerPlate.value;
    return total.value;
  }

  int discountedTotalPrice() {
    discountTotal.value = guest.value * pricePerPlate.value;
    return discountTotal.value;
  }

  String calculateDiscountPercentage(int originalPrice, int discountedPrice) {
    if (originalPrice == 0) return "0"; // Avoid division by zero
    int discount = originalPrice - discountedPrice;
    int percentage = (discount / originalPrice).toInt() * 100;
    return percentage.toString();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate.value = picked;
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
    );
    // ignore: unrelated_type_equality_checks
    if (picked != null && picked != selectedTime) {
     
      selectedTime.value = picked;
  
    }
  }

  String customDate() {
    return "${selectedDate.value.day}/${selectedDate.value.month}/${selectedDate.value.year}";
  }

  String customTime() {
    return "${selectedTime.value.hour}: ${selectedTime.value.minute}";
  }

  String get formattedTime {
    final now =
        DateTime(0, 0, 0, selectedTime.value.hour, selectedTime.value.minute);
    final timeFormat = DateFormat('h:mm a'); // 12-hour format with AM/PM
    return timeFormat.format(now);
  }

  // ignore: non_constant_identifier_names
  FlutterSlider GuestSelectionSlider() {
    return FlutterSlider(
      values: [guest.value.toDouble()],
      min: minGuest.value.toDouble(),
      max: maxGuest.value.toDouble(),
      handler: FlutterSliderHandler(
          child: Icon(Icons.person,
              color: Color.fromRGBO(151, 101, 202, 1), size: 35),
          foregroundDecoration: BoxDecoration(color: Colors.transparent),
          decoration: BoxDecoration(color: Colors.transparent)),
      trackBar: FlutterSliderTrackBar(
          activeTrackBar:
              BoxDecoration(color: Color.fromRGBO(151, 101, 202, 1))),
      onDragging: (handlerIndex, lowerValue, upperValue) {
        
        guest.value = lowerValue.toInt();
        updatedPrice();
        int discount = totalAmount() - discountedTotalPrice();
        percentage.value = ((discount / totalAmount()) * 100).toInt();
        
      },
    );
  }
}
