import 'package:flutter/material.dart';
import 'package:payu_checkoutpro_flutter_example/payu/api_money_pay_u_payment_view.dart';
import 'package:payu_checkoutpro_flutter_example/razorpay/razorpay.dart';
import 'package:utilities/theme/app_box_decoration.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FE),
      appBar: AppBar(
        title: const Text('Flutter Payment Gateways'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
            clipBehavior: Clip.hardEdge,
            decoration: AppBoxDecoration.getBoxDecoration(
              showShadow: false,
              borderRadius: 16,
            ),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/razor_pay_banner.png",
                    fit: BoxFit.cover,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RazorPayPaymentScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                    backgroundColor: const Color(0xFF066AC9),
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(),
                  ),
                  child: Text("Test Razor Pay".toUpperCase()),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
            clipBehavior: Clip.hardEdge,
            decoration: AppBoxDecoration.getBoxDecoration(
              showShadow: true,
              borderRadius: 16,
            ),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  child: Image.asset(
                    "assets/pay_u_banner.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ApiMoneyPayUPaymentScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                    backgroundColor: const Color(0xFF39AE41),
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(),
                  ),
                  child: Text("Test Pay U".toUpperCase()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
