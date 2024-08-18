import 'package:flutter/material.dart';

import '../data/model/courier.dart';

class CardCourier extends StatelessWidget {
  final Courier courier;
  final Function() onDetail;

  const CardCourier({super.key, required this.courier, required this.onDetail});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onDetail,
      child: Card(
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                courier.imageAsset,
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 8),
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
      ),
    );
  }
}
