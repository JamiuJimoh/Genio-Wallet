import 'package:flutter/material.dart';

import '../../../app_colors.dart';
import '../../shared_widgets/custom_container.dart';

class VisaCard extends StatelessWidget {
  const VisaCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CustomContainer(
          containerColor: AppColors.kOnsecondaryColor,
          radius: 20.0,
          maxHeight: 250.0,
          width: double.infinity,
        ),
        const CustomContainer(
          containerColor: AppColors.kSubtitleTextColor,
          radius: 20.0,
          maxHeight: 240.0,
          width: double.infinity,
        ),
        const CustomContainer(
          containerColor: AppColors.kOnprimaryColor,
          radius: 20.0,
          maxHeight: 230.0,
          width: double.infinity,
        ),
        CustomContainer(
          radius: 20.0,
          maxHeight: 220.0,
          width: double.infinity,
          padding: const EdgeInsets.all(25.0),
          gradient: const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              AppColors.kSecondaryColor,
              Colors.indigo,
              Colors.deepPurple,
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Universal',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(fontSize: 17.0, fontWeight: FontWeight.w400),
              ),
              Text(
                '**** ***** **** 6890',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(fontSize: 17.0, fontWeight: FontWeight.w400),
              ),
              Text(
                '\$5839.543',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(fontSize: 17.0, fontWeight: FontWeight.w400),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('01/25', style: Theme.of(context).textTheme.subtitle2),
                  SizedBox(
                    height: 40.0,
                    width: 40.0,
                    child: Image.asset('assets/images/visa.jpg'),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
