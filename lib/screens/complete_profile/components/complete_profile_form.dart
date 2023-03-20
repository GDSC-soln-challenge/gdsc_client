import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gdsc_client/screens/login_success/login_success_screen.dart';
import 'package:gdsc_client/screens/sign_in/sign_in_screen.dart';

import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:email_otp/email_otp.dart';
import 'package:http/http.dart' as http;

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String? name;
  String? profession;
  String? phoneNumber;
  String? address;
  EmailOTP myauth = EmailOTP();

  // Future save() async {
  //   var url = Uri.parse('http://10.0.2.2:8000/api/auth/register/profile');
  //   var response = await http.post(url, body: {
  //     'name': name,
  //     'profession': profession,
  //     'phone': phoneNumber,
  //     'location': address
  //   });
  //   return response;
  // }

  void registerProfile() async {
    var reqBody = {
      'name': name,
      'profession': profession,
      'phone': phoneNumber,
      'location': address
    };
    var response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/auth/register/profile'),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(reqBody));
    print("response: ${response.body}");
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse['status'] == true) {
      Navigator.pushNamed(context, SignInScreen.routeName);
    } else {
      const SnackBar(
        content: Text('Error'),
      );
    }
  }

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: 30 / 812 * MediaQuery.of(context).size.height),
          buildLastNameFormField(),
          SizedBox(height: 30 / 812 * MediaQuery.of(context).size.height),
          buildPhoneNumberFormField(),
          SizedBox(height: 30 / 812 * MediaQuery.of(context).size.height),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: 40 / 812 * MediaQuery.of(context).size.height),
          DefaultButton(
            text: "continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                registerProfile();
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Address",
        hintText: "Enter your phone address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSuffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => profession = newValue,
      decoration: const InputDecoration(
        labelText: "Profession",
        hintText: "Enter your profession",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Name",
        hintText: "Enter your name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
