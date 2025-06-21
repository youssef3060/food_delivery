import 'package:flutter/material.dart';
import 'package:food_delivery/utilities/app_assets';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  Widget orderVoucherItem({
    required String name,
    required int number,
    required BuildContext context,    
  }) {
    return Column(
      children: [
        Text(
          '$number',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: Colors.deepOrange),
        ),
        Text(name, style: Theme.of(context).textTheme.headlineMedium),
      ],
    );
  }

  Widget orderTapsItem({
    required String name,
    required IconData icon,
    String? names,
    required BuildContext context,
  }) {
    final size = MediaQuery.of(context).size;
    final isLandEscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.deepOrange,
        size: isLandEscape ? size.height * .15 : size.height * .05,
      ),
      title: Text(name, style: Theme.of(context).textTheme.titleLarge),
      onTap: () {},
      trailing: Icon(
        Icons.chevron_right,
        color: Colors.deepOrange,
        size: isLandEscape ? size.height * .15 : size.height * .05,
      ),
      subtitle: const Text(''),
    );
  }

  Widget personPhoto(double width, double height) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(AppAssets.accountPic),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final isLandEscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final name = Text(
      'youssef hossam',
      style: Theme.of(context).textTheme.displayMedium,
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          if (!isLandEscape) ...[
            personPhoto(size.width * .50, size.height * .50),

            const SizedBox(height: 20),

            name,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                orderVoucherItem(name: 'Orders', number: 50, context: context),
                orderVoucherItem(name: 'voucher', number: 10, context: context),
              ],
            ),
          ],
          if (isLandEscape) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    personPhoto(size.width * .25, size.height * .5),
                    name,
                  ],
                ),
                Column(
                  children: [
                    orderVoucherItem(
                      name: 'Orders',
                      number: 50,
                      context: context,
                    ),
                    const SizedBox(height: 20, width: 10),
                    orderVoucherItem(
                      name: 'voucher',
                      number: 10,
                      context: context,
                    ),
                  ],
                ),
              ],
            ),
          ],

          const Divider(),
          orderTapsItem(
            name: "Past Orders",
            icon: Icons.shopping_cart,
            context: context,
          ),
          const Divider(),
          orderTapsItem(
            name: 'Available Vouchers',
            icon: Icons.card_giftcard_outlined,
            context: context,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
