import 'dart:math';

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  int height;
  int weight;
  bool isMale;
  Result(
      {super.key,
      required this.height,
      required this.weight,
      required this.isMale});

  @override
  Widget build(BuildContext context) {
    double bmiRes = weight / pow(height / 100, 2);
    String? result;
    switch (bmiRes) {
      case < 18.5:
        result = "UnderWeight";
        break;
      case >= 18.5 && <= 24.9:
        result = "Optimum Range";

        break;
      case >= 24.9 && <= 29.9:
        result = "Overweight";

        break;
      default:
    }
    return Scaffold(
      backgroundColor: isMale ? Colors.blue : Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'The result is :',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            Text(
              bmiRes.toStringAsFixed(1),
              style: const TextStyle(
                fontSize: 35,
                color: Colors.white,
              ),
            ),
            Text(
              result.toString(),
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.restart_alt,
                size: 30,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
      // body: Expanded(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           const Text(
      //             'The result is :',
      //             style: TextStyle(
      //               fontSize: 25,
      //               color: Colors.white,
      //             ),
      //           ),
      //           Text(
      //             bmiRes.toStringAsFixed(1),
      //             style: const TextStyle(
      //               fontSize: 35,
      //               color: Colors.white,
      //             ),
      //           ),
      //           Text(
      //             result.toString(),
      //             style: const TextStyle(
      //               fontSize: 25,
      //               color: Colors.white,
      //             ),
      //           ),
      //           IconButton(
      //             onPressed: () {
      //               Navigator.pop(context);
      //             },
      //             icon: const Icon(
      //               Icons.restart_alt,
      //               size: 30,
      //               color: Colors.white,
      //             ),
      //           )
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
