import 'package:flutter/material.dart';

import 'widgets/my_sliver_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: MySliverAppBar(
              title: "ResiKuu",
              subText: "Ini Adalah Subtext",
              maxExtent: 210,
              minExtent: 85),
          floating: true,
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: Center(
            child: Text("Profil"),
          ),
        )
      ],
    );
  }
}
