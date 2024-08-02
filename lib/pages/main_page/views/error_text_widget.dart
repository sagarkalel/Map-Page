import 'package:flutter/material.dart';

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget({super.key, required this.errorText});

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Text(
      '  $errorText',
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: const Color(0xffA62A20)),
    );
  }
}
