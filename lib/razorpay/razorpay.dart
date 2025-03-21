import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payu_checkoutpro_flutter_example/utilities/common/info_widget.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayPaymentScreen extends StatefulWidget {
  const RazorPayPaymentScreen({super.key});

  @override
  State<RazorPayPaymentScreen> createState() => _RazorPayPaymentScreenState();
}

class _RazorPayPaymentScreenState extends State<RazorPayPaymentScreen> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void openPaymentGateway() {
    var options = {
      'key': 'rzp_test_0wFRWIZnH65uny',
      'amount': 100,
      'name': 'Sumit Chavan',
      'description': 'Contact : 8862071189',
      'image': 'https://avatars.githubusercontent.com/u/111274627?v=4', // Add your logo URL here
      'prefill': {
        'contact': '8862071189',
        'email': 'aaschavan8070@gmail.com',
      },
      'theme': {
        'color': '#066AC9',
      },
    };

    _razorpay.open(options);
  }

  showAlert({required String title, required String response}) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title.toString()),
          content: Text(response.toString()),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text("OK"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    showAlert(title: "Payment Successful", response: "Your payment ID is: ${response.paymentId}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    showAlert(title: "Payment Failed", response: "Reason: ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    showAlert(title: "💼 External Wallet", response: "You selected: ${response.walletName}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(flex: 2),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset("assets/razor_pay_icon.png"),
                ),
              ),
              const Spacer(flex: 2),
              Info(
                title: "Razorpay Unavailable",
                description:
                    "Razorpay services are temporarily unavailable due to maintenance. We are working to restore it as soon as possible. Please try again shortly.",
                btnText: "Pay",
                btnColor: const Color(0xFF066AC9),
                press: openPaymentGateway,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

