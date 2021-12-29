import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardItem extends StatelessWidget {
  const OnboardItem({
    Key? key,
    required this.assetName,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  final String assetName;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SvgPicture.asset(assetName),
        ),
        const SizedBox(height: 10.0),
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 10.0),
        Text(subtitle, style: Theme.of(context).textTheme.subtitle1),
      ],
    );
  }
}
