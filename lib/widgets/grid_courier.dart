import 'dart:core';

import 'package:flutter/material.dart';

import '../data/model/courier.dart';
import '../feature/detail/view/detail_screen.dart';
import 'card_courier.dart';

class GridCourier extends StatelessWidget {
  const GridCourier({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: Courier.list.length,
        itemBuilder: (context, index) {
          final courier = Courier.list[index];
          return CardCourier(
            courier: courier,
            onDetail: () {
              final route = MaterialPageRoute(
                builder: (context) => DetailScreen(courier: courier),
              );
              Navigator.push(context, route);
            },
          );
        },
      ),
    );
  }
}
