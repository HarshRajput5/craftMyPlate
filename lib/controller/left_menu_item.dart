import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class LeftMenuItem extends StatelessWidget {
  LeftMenuItem({
    super.key,
    required this.screenWidth,
    required this.isTrue,
    required this.label,
    required this.item,
    required this.image,
  });

  final double screenWidth;
  bool isTrue = true;
  String image;
  String label;
  String item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Stack(
              children: [
                //Circle Image
                CircleAvatar(
                  backgroundImage: AssetImage(image),
                  radius: 30,
                ),
                isTrue
                    ? Positioned(
                        top: 37,
                        right: 19,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            Gap(10),
            Text(label),
            Gap(10),
            Container(
              width: screenWidth * 0.15,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text(item)),
            )
          ],
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class LeftMenuItem2 extends StatelessWidget {
  LeftMenuItem2({
    super.key,
    required this.screenWidth,
    required this.isTrue,
    required this.label,
    required this.item,
    required this.image,
  });

  final double screenWidth;
  bool isTrue = true;
  String image;
  String label;
  String item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(234, 190, 255, 0.8),
                  Color.fromRGBO(250, 249, 250, 0.8)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 8),
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(image),
                      radius: 30,
                    ),
                    isTrue
                        ? Positioned(
                            top: 37,
                            right: 19,
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              child: Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                            ),
                          )
                        : Container()
                  ],
                ),
                Gap(10),
                Text(label),
                Gap(10),
                Container(
                  width: screenWidth * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      item,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
