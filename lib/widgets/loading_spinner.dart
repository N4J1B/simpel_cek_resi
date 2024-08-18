import 'package:flutter/material.dart';

Widget loadingSpinner() {
  return const Expanded(
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
