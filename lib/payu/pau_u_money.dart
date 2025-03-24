import 'dart:math';

import 'package:payu_checkoutpro_flutter/PayUConstantKeys.dart';

class PayUTestCredentials {

  static const merchantKey = ""; //  your Merchant Key
  static const iosSurl = "https://payuresponse.firebaseapp.com/success";
  static const iosFurl = "https://payuresponse.firebaseapp.com/failure";
  static const androidSurl = "https://payuresponse.firebaseapp.com/success";
  static const androidFurl = "https://payuresponse.firebaseapp.com/failure";

  static const merchantSalt = ""; // Add you Salt here.

  static const merchantAccessKey = ""; //Add Merchant Access Key - Optional
  static const sodexoSourceId = ""; //Add sodexo Source Id - Optional
}

class PayUParams {
  static Map<String, dynamic> createPayUPaymentParams({
    required String orderId,
    required String userId,
    required String candidateId,
    required String udf4,
    required String appName,
    required String amt,
    required String planName,
    required String clientName,
    required String email,
    required String phone,
  }) {
    var additionalParam = {
      PayUAdditionalParamKeys.udf1: orderId,
      PayUAdditionalParamKeys.udf2: userId,
      PayUAdditionalParamKeys.udf3: candidateId,
      PayUAdditionalParamKeys.udf4: udf4,
      PayUAdditionalParamKeys.udf5: appName,
    };

    var payUPaymentParams = {
      PayUPaymentParamKey.key: PayUTestCredentials.merchantKey,
      PayUPaymentParamKey.amount: amt,
      PayUPaymentParamKey.productInfo: planName,
      PayUPaymentParamKey.firstName: clientName,
      PayUPaymentParamKey.email: email,
      PayUPaymentParamKey.phone: phone,
      PayUPaymentParamKey.ios_surl: PayUTestCredentials.iosSurl,
      PayUPaymentParamKey.ios_furl: PayUTestCredentials.iosFurl,
      PayUPaymentParamKey.android_surl: PayUTestCredentials.androidSurl,
      PayUPaymentParamKey.android_furl: PayUTestCredentials.androidFurl,
      PayUPaymentParamKey.environment: "1",
      PayUPaymentParamKey.userCredential: email,
      PayUPaymentParamKey.transactionId: "${DateTime.now().microsecondsSinceEpoch}${Random().nextInt(10)}",
      PayUPaymentParamKey.additionalParam: additionalParam,
      PayUPaymentParamKey.enableNativeOTP: true,
      PayUAdditionalParamKeys.merchantAccessKey: PayUTestCredentials.merchantAccessKey,
      PayUAdditionalParamKeys.sourceId: PayUTestCredentials.sodexoSourceId,
    };

    return payUPaymentParams;
  }

  static Map<String, dynamic> createPayUConfigParams() {
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



    var payUCheckoutProConfig = {
      PayUCheckoutProConfigKeys.primaryColor: "#39AE41",
      PayUCheckoutProConfigKeys.secondaryColor: "#FFFFFF",
      PayUCheckoutProConfigKeys.merchantName: "Sumit Chavan",
      PayUCheckoutProConfigKeys.merchantLogo: 'assets/pay_u_banner.png',
      PayUCheckoutProConfigKeys.showExitConfirmationOnCheckoutScreen: true,
      PayUCheckoutProConfigKeys.showExitConfirmationOnPaymentScreen: true,
      PayUCheckoutProConfigKeys.paymentModesOrder: paymentModesOrder,
      PayUCheckoutProConfigKeys.merchantResponseTimeout: 10000,
      PayUCheckoutProConfigKeys.autoSelectOtp: true,
      PayUCheckoutProConfigKeys.waitingTime: 10000,
      PayUCheckoutProConfigKeys.autoApprove: true,
      PayUCheckoutProConfigKeys.merchantSMSPermission: true,
      PayUCheckoutProConfigKeys.showCbToolbar: true,
    };
    return payUCheckoutProConfig;
  }
}
