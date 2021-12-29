import 'package:flutter/material.dart';

import '../../app_colors.dart';
import 'widgets/category_container.dart';
import 'widgets/visa_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.all(0.0),
                  leading: const CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage('assets/images/jamiu.jpg'),
                  ),
                  title: Text(
                    'Jamiu Jimoh',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    'Software Developer',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                const SizedBox(height: 25.0),
                const VisaCard(),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CategoryContainer(
                      icon: Icons.payments_outlined,
                      label: 'Payment',
                    ),
                    CategoryContainer(
                      icon: Icons.credit_card_outlined,
                      label: 'Credit',
                    ),
                    CategoryContainer(
                      icon: Icons.vpn_key_outlined,
                      label: 'Rent',
                    ),
                    CategoryContainer(
                      icon: Icons.local_grocery_store_outlined,
                      label: 'Market',
                    ),
                    CategoryContainer(
                      icon: Icons.phone_outlined,
                      label: 'Recharge',
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transactions',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const Icon(Icons.more_horiz_outlined,
                        color: AppColors.kOnprimaryColor),
                  ],
                ),
                const SizedBox(height: 20.0),
                ListTile(
                  contentPadding: const EdgeInsets.all(0.0),
                  leading: const CircleAvatar(
                    radius: 25.0,
                    backgroundColor: AppColors.kAccentColor2,
                    child: Icon(Icons.phone_outlined,
                        color: AppColors.kOnprimaryColor),
                  ),
                  title: Text(
                    'MTN',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  subtitle: Text(
                    'Aug 27, 2021 at 5:19',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  trailing: Text(
                    '-\$120.50',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(0.0),
                  leading: const CircleAvatar(
                    radius: 25.0,
                    backgroundColor: AppColors.kAccentColor2,
                    child: Icon(Icons.local_grocery_store_outlined,
                        color: AppColors.kOnprimaryColor),
                  ),
                  title: Text(
                    'Nike',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  subtitle: Text(
                    'Dec 20, 2021 at 12:19',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  trailing: Text(
                    '-\$255.60',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(0.0),
                  leading: const CircleAvatar(
                    radius: 25.0,
                    backgroundColor: AppColors.kAccentColor2,
                    child: Icon(Icons.credit_card_outlined,
                        color: AppColors.kOnprimaryColor),
                  ),
                  title: Text(
                    'Electricity bill',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  subtitle: Text(
                    'Nov 12, 2021 at 6:19',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  trailing: Text(
                    '-\$320.10',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(0.0),
                  leading: const CircleAvatar(
                    radius: 25.0,
                    backgroundColor: AppColors.kAccentColor2,
                    child: Icon(Icons.vpn_key_outlined,
                        color: AppColors.kOnprimaryColor),
                  ),
                  title: Text(
                    'Rent',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  subtitle: Text(
                    'Dec 01, 2021 at 00:00',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  trailing: Text(
                    '-\$1000.00',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(0.0),
                  leading: const CircleAvatar(
                    radius: 25.0,
                    backgroundColor: AppColors.kAccentColor2,
                    child: Icon(Icons.phone_outlined,
                        color: AppColors.kOnprimaryColor),
                  ),
                  title: Text(
                    'MTN',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  subtitle: Text(
                    'Nov 02, 2021 at 7:10',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  trailing: Text(
                    '-\$100.00',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (i) => setState(() {
            _selectedIndex = i;
          }),
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon:
                  Icon(_selectedIndex == 0 ? Icons.home : Icons.home_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 1
                  ? Icons.calendar_today
                  : Icons.calendar_today_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 2
                  ? Icons.credit_card
                  : Icons.credit_card_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 3
                  ? Icons.person_rounded
                  : Icons.person_outline_rounded),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
