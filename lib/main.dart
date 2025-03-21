//TODO
import 'package:flutter/material.dart';
import 'package:payu_checkoutpro_flutter_example/landing_view.dart';
import 'package:payu_checkoutpro_flutter_example/payu/api_money_pay_u_payment_view.dart';
import 'package:payu_checkoutpro_flutter_example/razorpay/razorpay.dart';
import 'package:payu_checkoutpro_flutter_example/theme/core_theme.dart';
import 'package:utilities/theme/app_box_decoration.dart';

// TODO: add flutter_svg package to pubspec.yaml

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CoreAppTheme.theme(),
      home: const LandingView(),
      debugShowCheckedModeBanner: false,
    );
  }
}


