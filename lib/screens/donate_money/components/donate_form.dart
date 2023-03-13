import 'package:flutter/material.dart';

import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../login_success/login_success_screen.dart';
// import 'package:http/http.dart' as http;

class DonateMoneyForm extends StatefulWidget {
  const DonateMoneyForm({super.key});

  @override
  _DonateMoneyFormState createState() => _DonateMoneyFormState();
}

class _DonateMoneyFormState extends State<DonateMoneyForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? type;
  String? amount;
  String? restaurantName;
  bool? remember = false;
  final List<String> errors = [];

  Future save() async {}

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
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
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          // buildPasswordFormField(),
          buildTypeFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildSwitchCaseFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginSuccess(),
                  ),
                );
                // save().then((value) {
                //   if (value.statusCode == 200) {
                //     Navigator.pushNamed(context, LoginSuccess.routeName);
                //   } else {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(
                //         content: Text('Invalid Credentials'),
                //       ),
                //     );
                //   }
                // });
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildSwitchCaseFormField() {
    switch (type) {
      case 'Donate Money':
        return buildMoneyFormField();
      case 'Donate Food':
        return buildFoodFormField();
      // case 'Donate Clothes':
      //   return buildClothesFormField();
      // case 'Donate Books':
      //   return buildBooksFormField();
      default:
        return buildMoneyFormField();
    }
  }

  // build Food Form Field  form fields for food donation
  TextFormField buildFoodFormField() {
    return TextFormField(
      onSaved: (newValue) => restaurantName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kRestaurantNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kRestaurantNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Restaurant Name",
        hintText: "Enter Restaurant Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Money.svg"),
      ),
    );
  }

  TextFormField buildMoneyFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => amount = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAmountNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAmountNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Amount",
        hintText: "Enter Amount",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Money.svg"),
      ),
    );
  }

  // dropdown buildTypeFormField
  DropdownButtonFormField buildTypeFormField() {
    return DropdownButtonFormField(
      value: 'Donate Money',
      onSaved: (newValue) => type = newValue,
      items: const [
        DropdownMenuItem(
          value: 'Donate Money',
          child: Text('Donate Money'),
        ),
        DropdownMenuItem(
          value: 'Donate Food',
          child: Text('Donate Food'),
        ),
        DropdownMenuItem(
          value: 'Donate Clothes',
          child: Text('Donate Clothes'),
        ),
        DropdownMenuItem(
          value: 'Donate Books',
          child: Text('Donate Books'),
        ),
      ],
      onChanged: (value) {
        setState(() {
          type = value.toString();
        });
      },
      decoration: const InputDecoration(
        labelText: 'Type',
        hintText: 'Select Type',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSuffixIcon(svgIcon: 'assets/icons/Type.svg'),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      // obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
