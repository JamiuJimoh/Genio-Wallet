import 'package:flutter/material.dart';

import '../../model/onboarding_model.dart';
import 'onboard_item.dart';
import 'onboarding_data.dart';

class OnboardingSection extends StatefulWidget {
  const OnboardingSection({
    Key? key,
    required this.index,
  }) : super(key: key);
  final void Function(int) index;

  @override
  _OnboardingSectionState createState() => _OnboardingSectionState();
}

class _OnboardingSectionState extends State<OnboardingSection> {
  late final List<Onboarding> data;
  @override
  void initState() {
    super.initState();
    data = OnboardingData().data;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 30.0),
      child: PageView.builder(
        itemCount: data.length,
        itemBuilder: (_, i) => OnboardItem(
          assetName: data[i].svg,
          title: data[i].title,
          subtitle: data[i].subtitle,
        ),
        onPageChanged: (i) => widget.index(i),
      ),
    );
  }
}
