import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../data/model/resi.dart';

class ListPackageHistory extends StatelessWidget {
  final List<History> history;

  const ListPackageHistory({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Riwayat Pengiriman",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 16,
          ),
          history.isEmpty
              ? const Text(
                  "-",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                )
              : SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: history.map((item) {
                      return TimelineTile(
                        alignment: TimelineAlign.start,
                        isFirst: history.indexOf(item) == 0,
                        isLast: history.indexOf(item) == history.length - 1,
                        indicatorStyle: const IndicatorStyle(
                          width: 20,
                          color: Colors.blue,
                          padding: EdgeInsets.all(6),
                        ),
                        endChild: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.date,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                item.desc,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                )
        ],
      ),
    );
  }
}
