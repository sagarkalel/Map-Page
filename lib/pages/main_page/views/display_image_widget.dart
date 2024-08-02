import 'dart:io';

import 'package:flutter/material.dart';
import 'package:map_page/utils/constants.dart';

class DisplayImageWidget extends StatelessWidget {
  const DisplayImageWidget({super.key, required this.file});

  final File file;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        height: 100,
        width: (getScreenX(context) - 48) / 2,
        child: Image.file(file, fit: BoxFit.cover),
      ),
    );
  }
}
