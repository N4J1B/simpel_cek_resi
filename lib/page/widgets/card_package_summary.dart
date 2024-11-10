import 'package:flutter/material.dart';

import '../../data/model/resi.dart';

class CardPackageSummary extends StatelessWidget {
  final Summary summary;

  const CardPackageSummary({super.key, required this.summary});

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
              "Nomor Resi",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
            ),
            Text(summary.awb,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Status",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
            ),
            Text(summary.status,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Tanggal",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
            ),
            Text(summary.date,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Deskripsi",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
            ),
            Text(summary.desc,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Berat",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
            ),
            Text(summary.weight,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Biaya",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
            ),
            Text(summary.amount,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
