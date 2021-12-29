import '../../model/onboarding_model.dart';

class OnboardingData {
  static const List<Onboarding> _data = [
    Onboarding(
      svg: 'assets/images/pay.svg',
      title: 'Pay with one click',
      subtitle:
          'Enjoy the features for financial payments and transfers with a single click',
    ),
    Onboarding(
      svg: 'assets/images/send.svg',
      title: 'Send with one click',
      subtitle:
          'Enjoy the features for financial payments and transfers with a single click',
    ),
    Onboarding(
      svg: 'assets/images/recieve.svg',
      title: 'Receive funds from anywhere',
      subtitle:
          'With the new cutting edge technology, you can receive payments from up to 30+ countries',
    ),
  ];

  List<Onboarding> get data => _data;
}
