import 'package:flutter/material.dart';

import '../../data/model/resi.dart';

class CardPackageDetail extends StatelessWidget {
  final Detail detail;

  const CardPackageDetail({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Asal",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
            ),
            Text(detail.origin,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Tujuan",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
            ),
            Text(detail.destination,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Pengirim",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
            ),
            Text(detail.shipper,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Penerima",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
            ),
            Text(detail.receiver,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
