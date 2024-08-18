import 'package:flutter/material.dart';

import '../data/model/courier.dart';

class CardInfoCourier extends StatelessWidget {
  final Courier courier;

  const CardInfoCourier({super.key, required this.courier});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              courier.imageAsset,
              width: 100,
              height: 100,
            ),
            const SizedBox(width: 8),
            Text(
              courier.description,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
