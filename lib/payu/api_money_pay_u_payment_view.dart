import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payu_checkoutpro_flutter/payu_checkoutpro_flutter.dart';
import 'package:payu_checkoutpro_flutter_example/payu/HashService.dart';
import 'package:payu_checkoutpro_flutter_example/payu/pau_u_money.dart';
import 'package:payu_checkoutpro_flutter_example/utilities/common/info_widget.dart';
import 'package:payu_checkoutpro_flutter_example/utilities/common/logger.dart';

class ApiMoneyPayUPaymentScreen extends StatefulWidget {
  const ApiMoneyPayUPaymentScreen({super.key});

  @override
  State<ApiMoneyPayUPaymentScreen> createState() => _ApiMoneyPayUPaymentScreenState();
}

class _ApiMoneyPayUPaymentScreenState extends State<ApiMoneyPayUPaymentScreen>
    implements PayUCheckoutProProtocol {
  late PayUCheckoutProFlutter _checkoutPro;

  @override
  void initState() {
    super.initState();

    _checkoutPro = PayUCheckoutProFlutter(this);
  }

  makePayment() {
    _checkoutPro.openCheckoutScreen(
      payUPaymentParams: PayUParams.createPayUPaymentParams(
        orderId: "orderId",
        //udf1
        userId: "userId",
        //udf2
        candidateId: "candidateId",
        //udf3
        udf4: "",
        //udf4
        appName: "name",
        //udf4
        amt: "1",
        planName: 'plan',
        clientName: "client name",
        email: "email",
        phone: "8862071189",
      ),
      payUCheckoutProConfig: PayUParams.createPayUConfigParams(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FE),
      body: Column(
        children: [
          const Spacer(flex: 2),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipOval(
                child: Image.asset(
                  "assets/pay_u_icon.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Spacer(flex: 2),
          Info(
            title: "PayU Available",
            description:
                "PayU service is currently available. Please use PayU to complete your payment",
            btnText: "Pay",
            btnColor: const Color(0xFF39AE41),
            press: makePayment,
          ),
        ],
      ),
    );
  }

  @override
  generateHash(Map response) {
    Map hashResponse = {};
    hashResponse = HashService.generateHash(response);

    _checkoutPro.hashGenerated(hash: hashResponse);
  }

  @override
  onPaymentSuccess(dynamic response) {
    showAlert(title: "Payment Success", response: "$response");

    logger.f("onPaymentSuccess res -->  ${response.toString()}");
  }

  @override
  onPaymentFailure(dynamic response) {
    showAlert(title: "Payment Failure", response: "$response");

    logger.e("onPaymentFailure res -->  ${response.toString()}");
  }

  @override
  onPaymentCancel(Map? response) {
    showAlert(title: "Payment Canceled", response: "$response");

    logger.e("onPaymentCancel res -->  ${response.toString()}");
  }

  @override
  onError(Map? response) {
    showAlert(title: "Payment Failed", response: "Your payment ID is: ${response.toString()}");

    logger.e("onError res -->  ${response.toString()}");
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
}
