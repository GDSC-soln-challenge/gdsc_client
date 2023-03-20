import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_client/screens/otp/components/body.dart';

import '../../size_config.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  const OtpScreen({super.key, required this.myauth});
  final EmailOTP myauth;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
      ),
      body: Body(myauth: myauth),
    );
  }
}
