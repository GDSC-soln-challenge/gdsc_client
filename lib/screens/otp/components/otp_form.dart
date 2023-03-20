import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdsc_client/screens/complete_profile/complete_profile_screen.dart';
import 'package:gdsc_client/screens/home/home_screen.dart';
import 'package:gdsc_client/screens/login_success/login_success_screen.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

// class Otp extends StatelessWidget {
//   const Otp({
//     Key? key,
//     required this.otpController,
//   }) : super(key: key);
//   final TextEditingController otpController;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 50,
//       height: 50,
//       child: TextFormField(
//         controller: otpController,
//         keyboardType: TextInputType.number,
//         style: Theme.of(context).textTheme.headline6,
//         textAlign: TextAlign.center,
//         inputFormatters: [
//           LengthLimitingTextInputFormatter(1),
//           FilteringTextInputFormatter.digitsOnly
//         ],
//         onChanged: (value) {
//           if (value.length == 1) {
//             FocusScope.of(context).nextFocus();
//           }
//           if (value.isEmpty) {
//             FocusScope.of(context).previousFocus();
//           }
//         },
//         decoration: const InputDecoration(
//           hintText: ('0'),
//         ),
//         onSaved: (value) {},
//       ),
//     );
//   }
// }

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
    required this.myauth,
  }) : super(key: key);
  final EmailOTP myauth;

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();

  String otpController = "1234";

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  controller: otp1Controller,
                  autofocus: true,
                  // obscureText: true,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                    if (value.isEmpty) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  controller: otp2Controller,
                  focusNode: pin2FocusNode,
                  // obscureText: true,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                    if (value.isEmpty) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  controller: otp3Controller,
                  focusNode: pin3FocusNode,
                  // obscureText: true,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                    if (value.isEmpty) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  controller: otp4Controller,
                  focusNode: pin4FocusNode,
                  // obscureText: true,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                    if (value.isEmpty) {
                      FocusScope.of(context).previousFocus();
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Continue",
            press: () {
              otpController = otp1Controller.text +
                  otp2Controller.text +
                  otp3Controller.text +
                  otp4Controller.text;

              if (widget.myauth.verifyOTP(otp: otpController)) {
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              } else {
                const SnackBar(content: Text("Invalid OTP"));
              }
            },
          )
        ],
      ),
    );
  }
}
