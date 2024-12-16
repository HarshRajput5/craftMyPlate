import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class VegNonVegRow extends StatelessWidget {
  const VegNonVegRow({
    super.key,
    required this.screenWidth,
    required ValueNotifier<bool> controller,
  }) : _controller = controller;

  final double screenWidth;
  final ValueNotifier<bool> _controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Gap(10),
        SvgPicture.asset("images/Vector.svg"),
        Gap(10),
        Text(
          "Pure Veg",
          style: TextStyle(
            color: const Color.fromARGB(255, 4, 102, 8),
            fontSize: screenWidth*0.045,
            fontWeight: FontWeight.w500
          ),
        ),
        Gap(10),

        // Veg Non-Veg Selection Switch Button
        VegNonVegSelection(controller: _controller),

        Gap(10),
        Image.asset("images/nonVeg.png"),
        Gap(10),
        Text(
          "Non Veg",
          style: TextStyle(
            color: Colors.red,
            fontSize: screenWidth*0.045,
            fontWeight: FontWeight.w500
          ),
        ),
      ],
    );
  }
}

class VegNonVegSelection extends StatelessWidget {
  const VegNonVegSelection({
    super.key,
    required ValueNotifier<bool> controller,
  }) : _controller = controller;

  final ValueNotifier<bool> _controller;

  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      controller: _controller,
      activeColor: const Color.fromARGB(255, 248, 2, 2),
      inactiveColor: Colors.green,
      activeChild: Padding(
        padding: const EdgeInsets.only(left:12),
        child: Text('Non Veg'),
      ),
      inactiveChild: Padding(
        padding: const EdgeInsets.only(right:12.0),
        child: Text('Veg'),
      ),
      thumb: ValueListenableBuilder(
        valueListenable: _controller,
        builder: (_, value, __) {
          return value ? Image.asset("images/nonVeg.png"):Image.asset("images/Veg.png");
        },
      ),
      borderRadius: BorderRadius.all(const Radius.circular(15)),
      width: 70.0,
      height: 30.0,
      enabled: true,
      disabledOpacity: 0.5,
    );
  }
}
