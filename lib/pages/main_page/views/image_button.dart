import 'package:flutter/material.dart';
import 'package:map_page/utils/constants.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({super.key, required this.onTap, required this.label});

  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.3),
                  blurRadius: 4,
                  offset: const Offset(1, 2))
            ],
          ),
          child: Column(
            children: [
              Image.asset(
                "assets/images/add_image_icon.png",
                height: 100,
                width: (getScreenX(context) - 48) / 2,
              ),
              const YGap(10),
              Text(label, style: Theme.of(context).textTheme.titleMedium),
              const YGap(10),
            ],
          ),
        ));
  }
}
