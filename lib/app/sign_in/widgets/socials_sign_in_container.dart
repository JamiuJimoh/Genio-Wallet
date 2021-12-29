import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:genio_wallet/app/shared_widgets/custom_container.dart';

import '../../../app_colors.dart';

class SocialSignInContainer extends CustomContainer {
  const SocialSignInContainer({Key? key, required Widget child})
      : super(
          key: key,
          containerColor: AppColors.kSecondaryColor,
          
          topLeftRadius: 30.0,
          topRightRadius: 30.0,
          radius: 0.0,
          child: child,
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
        );
}
