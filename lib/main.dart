//TODO
import 'package:flutter/material.dart';
import 'package:payu_checkoutpro_flutter/PayUConstantKeys.dart';
import 'package:payu_checkoutpro_flutter/payu_checkoutpro_flutter.dart';
import 'package:payu_checkoutpro_flutter_example/HashService.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> implements PayUCheckoutProProtocol {
  late PayUCheckoutProFlutter _checkoutPro;

  @override
  void initState() {
    super.initState();
    _checkoutPro = PayUCheckoutProFlutter(this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PayU Checkout Pro'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text("Start Payment"),
            onPressed: () async {
              _checkoutPro.openCheckoutScreen(
                payUPaymentParams: PayUParams.createPayUPaymentParams(),
                payUCheckoutProConfig: PayUParams.createPayUConfigParams(),
              );
            },
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, String title, String content) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: new Text(content),
            ),
            actions: [okButton],
          );
        });
  }

  // HASH GENERATION LOGIC
  @override
  generateHash(Map response) async {
    print("generateHash() called with response: $response");

    Map hashResponse = HashService.generateHash(response);
    print("Generated hashResponse: $hashResponse");

    _checkoutPro.hashGenerated(hash: hashResponse);
  }

  // CALLBACKS
  @override
  onPaymentSuccess(dynamic response) {
    print("onPaymentSuccess: $response");
    showAlertDialog(context, "onPaymentSuccess", response.toString());
  }

  @override
  onPaymentFailure(dynamic response) {
    print("onPaymentFailure: $response");
    showAlertDialog(context, "onPaymentFailure", response.toString());
  }

  @override
  onPaymentCancel(Map? response) {
    print("onPaymentCancel: $response");
    showAlertDialog(context, "onPaymentCancel", response.toString());
  }

  @override
  onError(Map? response) {
    print("onError: $response");
    showAlertDialog(context, "onError", response.toString());
  }
}

// class PayUTestCredentials {
//   //Find the test credentials from dev guide: https://devguide.payu.in/flutter-sdk-integration/getting-started-flutter-sdk/mobile-sdk-test-environment/
//   static const merchantKey = "3TnMpV";// Add you Merchant Key
//   static const iosSurl = "https://flutter.dev/";
//   static const iosFurl = "https://flutter.dev/";
//   static const androidSurl = "https://flutter.dev/";
//   static const androidFurl = "https://flutter.dev/";
//
//   static const merchantAccessKey = "";//Add Merchant Access Key - Optional
//   static const sodexoSourceId = ""; //Add sodexo Source Id - Optional
// }

class PayUTestCredentials {
  // These are standard PayU Money sandbox credentials used for testing
  static const merchantKey = "aJWzRK"; // PayU Money sandbox test key
  static const iosSurl = "https://www.payumoney.com/mobileapp/payumoney/success.php";
  static const iosFurl = "https://www.payumoney.com/mobileapp/payumoney/failure.php";
  static const androidSurl = "https://www.payumoney.com/mobileapp/payumoney/success.php";
  static const androidFurl = "https://www.payumoney.com/mobileapp/payumoney/failure.php";

  static const merchantAccessKey = ""; // Leave empty if not applicable for testing
  static const sodexoSourceId = ""; // Leave empty if not applicable for testing
}

//Pass these values from your app to SDK, this data is only for test purpose
class PayUParams {
  static Map createPayUPaymentParams() {
    var siParams = {
      PayUSIParamsKeys.isFreeTrial: true,
      PayUSIParamsKeys.billingAmount: '1', //Required
      PayUSIParamsKeys.billingInterval: "1", //Required
      PayUSIParamsKeys.paymentStartDate: '2023-04-20', //Required
      PayUSIParamsKeys.paymentEndDate: '2023-04-30', //Required
      PayUSIParamsKeys.billingCycle: 'daily',
      PayUSIParamsKeys.remarks: 'Test SI transaction',
      PayUSIParamsKeys.billingCurrency: 'INR',
      PayUSIParamsKeys.billingLimit: 'ON', //ON, BEFORE, AFTER
      PayUSIParamsKeys.billingRule: 'MAX', //MAX, EXACT
    };
    var additionalParam = {
      PayUAdditionalParamKeys.udf1: "udf1",
      PayUAdditionalParamKeys.udf2: "udf2",
      PayUAdditionalParamKeys.udf3: "udf3",
      PayUAdditionalParamKeys.udf4: "udf4",
      PayUAdditionalParamKeys.udf5: "udf5",
      // Comment these out if not needed:
      // PayUAdditionalParamKeys.merchantAccessKey: PayUTestCredentials.merchantAccessKey,
      // PayUAdditionalParamKeys.sourceId: PayUTestCredentials.sodexoSourceId,
    };

    // var spitPaymentDetails = {
    //   "type": "absolute",
    //   "splitInfo": {
    //     PayUTestCredentials.merchantKey: {
    //       "aggregatorSubTxnId": "1234567540099887766650091", //unique for each transaction
    //       "aggregatorSubAmt": "1"
    //     }
    //   }
    // };

    // var payUPaymentParams = {
    //   PayUPaymentParamKey.key: PayUTestCredentials.merchantKey,
    //   PayUPaymentParamKey.amount: "1",
    //   PayUPaymentParamKey.productInfo: "Info",
    //   PayUPaymentParamKey.firstName: "Abc",
    //   PayUPaymentParamKey.email: "test@gmail.com",
    //   PayUPaymentParamKey.phone: "9999999999",
    //   PayUPaymentParamKey.ios_surl: PayUTestCredentials.iosSurl,
    //   PayUPaymentParamKey.ios_furl: PayUTestCredentials.iosFurl,
    //   PayUPaymentParamKey.android_surl: PayUTestCredentials.androidSurl,
    //   PayUPaymentParamKey.android_furl: PayUTestCredentials.androidFurl,
    //   PayUPaymentParamKey.environment: "1", // Sandbox mode
    //   PayUPaymentParamKey.transactionId: DateTime.now().millisecondsSinceEpoch.toString(),
    //   PayUPaymentParamKey.additionalParam: additionalParam,
    //   PayUPaymentParamKey.enableNativeOTP: true,
    // };
    var payUPaymentParams = {
      PayUPaymentParamKey.key: PayUTestCredentials.merchantKey,
      PayUPaymentParamKey.amount: "1",
      PayUPaymentParamKey.productInfo: "Info",
      PayUPaymentParamKey.firstName: "Abc",
      PayUPaymentParamKey.email: "test@gmail.com",
      PayUPaymentParamKey.phone: "9999999999",
      PayUPaymentParamKey.ios_surl: PayUTestCredentials.iosSurl,
      PayUPaymentParamKey.ios_furl: PayUTestCredentials.iosFurl,
      PayUPaymentParamKey.android_surl: PayUTestCredentials.androidSurl,
      PayUPaymentParamKey.android_furl: PayUTestCredentials.androidFurl,
      PayUPaymentParamKey.environment: "0", //0 => Production 1 => Test
      PayUPaymentParamKey.userCredential: DateTime.now().toString(), //Pass user credential to fetch saved cards => A:B - Optional
      PayUPaymentParamKey.transactionId: DateTime.now().millisecondsSinceEpoch.toString(),
      PayUPaymentParamKey.additionalParam: additionalParam,
      PayUPaymentParamKey.enableNativeOTP: true,
      // PayUPaymentParamKey.splitPaymentDetails:json.encode(spitPaymentDetails),
      PayUPaymentParamKey.userToken:"", //Pass a unique token to fetch offers. - Optional
    };
    return payUPaymentParams;
  }

  static Map createPayUConfigParams() {
    var paymentModesOrder = [
      {"Wallets": "PHONEPE"},
      {"UPI": "TEZ"},
      {"Wallets": ""},
      {"EMI": ""},
      {"NetBanking": ""},
    ];

    var cartDetails = [
      {"GST": "5%"},
      {"Delivery Date": "25 Dec"},
      {"Status": "In Progress"}
    ];
    var enforcePaymentList = [
      {"payment_type": "CARD", "enforce_ibiboCode": "UTIBENCC"},
    ];

    var customNotes = [
      {
        "custom_note": "Its Common custom note for testing purpose",
        "custom_note_category": [PayUPaymentTypeKeys.emi, PayUPaymentTypeKeys.card]
      },
      {"custom_note": "Payment options custom note", "custom_note_category": null}
    ];

    var payUCheckoutProConfig = {
      PayUCheckoutProConfigKeys.primaryColor: "#4994EC",
      PayUCheckoutProConfigKeys.secondaryColor: "#FFFFFF",
      PayUCheckoutProConfigKeys.merchantName: "PayU",
      PayUCheckoutProConfigKeys.merchantLogo: "logo",
      PayUCheckoutProConfigKeys.showExitConfirmationOnCheckoutScreen: true,
      PayUCheckoutProConfigKeys.showExitConfirmationOnPaymentScreen: true,
      PayUCheckoutProConfigKeys.cartDetails: cartDetails,
      PayUCheckoutProConfigKeys.paymentModesOrder: paymentModesOrder,
      PayUCheckoutProConfigKeys.merchantResponseTimeout: 30000,
      PayUCheckoutProConfigKeys.customNotes: customNotes,
      PayUCheckoutProConfigKeys.autoSelectOtp: true,
      // PayUCheckoutProConfigKeys.enforcePaymentList: enforcePaymentList,
      PayUCheckoutProConfigKeys.waitingTime: 30000,
      PayUCheckoutProConfigKeys.autoApprove: true,
      PayUCheckoutProConfigKeys.merchantSMSPermission: true,
      PayUCheckoutProConfigKeys.showCbToolbar: true,
    };
    return payUCheckoutProConfig;
  }
}
