import 'dart:core';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/model/courier.dart';
import '../feature/detail/view/detail_screen.dart';
import '../feature/detail/viewmodel/detail_view_model.dart';
import 'card_courier.dart';

class GridCourier extends StatelessWidget {
  const GridCourier({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate the number of columns based on the width of the GridView
          int crossAxisCount = (constraints.maxWidth / 200).floor().clamp(2, 4);
          final viewModel =
              Provider.of<DetailViewModel>(context, listen: false);

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
            ),
            itemCount: Courier.list.length,
            itemBuilder: (context, index) {
              final courier = Courier.list[index];
              return CardCourier(
                courier: courier,
                onDetail: () {
                  final route = MaterialPageRoute(
                    builder: (context) => DetailScreen(courier: courier),
                  );
                  viewModel.reset();
                  Navigator.push(context, route);
                },
              );
            },
          );
        },
      ),
    );
  }
}
