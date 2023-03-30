import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:gdsc_client/components/navigation_drawer.dart';
import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:http/http.dart' as http;

class DonateMoneyForm extends StatefulWidget {
  const DonateMoneyForm({super.key});

  @override
  _DonateMoneyFormState createState() => _DonateMoneyFormState();
}

class _DonateMoneyFormState extends State<DonateMoneyForm> {
  Map<String, dynamic>? paymentIntentData;
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? type;
  String? amount;
  String? quantity;
  bool? remember = false;
  int totalAmount = 0;
  final List<String> errors = [];
  var amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void donate() async {
    var reqBody = {
      'type': type,
      'quantity': quantity,
      'description': 'Donation',
      'location': location,
      'userId': uid,
    };

    var response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/poverty/donation'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(reqBody),
    );

    var jsonResponse = jsonDecode(response.body);
    print("status: ${jsonResponse['status']}");
    if (jsonResponse['status'] == true) {
      print("Donation Successful");
    } else {
      print("Donation Failed");
    }

    // print("email: ${jsonResponse['data']['email']}");
  }

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
          // buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          // buildPasswordFormField(),
          buildTypeFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildSwitchCaseFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // check type from dropdown
                if (type == 'ONE_TIME_MONEY') {
                  // await makePayment();
                  donate();
                  // show snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Payment Successful'),
                    ),
                  );
                } else {
                  donate();
                }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildSwitchCaseFormField() {
    switch (type) {
      case 'ONE_TIME_MONEY':
        return buildMoneyFormField();
      case 'FOOD':
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
      onSaved: (newValue) => quantity = newValue,
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
        labelText: "Quantity",
        hintText: "Enter Quantity",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Money.svg"),
      ),
    );
  }

  TextFormField buildMoneyFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => quantity = newValue,
      controller: amountController,
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
      value: 'ONE_TIME_MONEY',
      onSaved: (newValue) => type = newValue,
      items: const [
        DropdownMenuItem(
          value: 'ONE_TIME_MONEY',
          child: Text('Donate Money'),
        ),
        DropdownMenuItem(
          value: 'FOOD',
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
          totalAmount = num.parse(amount!).toInt();
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

  Future<void> makePayment() async {
    try {
      paymentIntentData =
          await createPaymentIntent('20', 'USD'); //json.decode(response.body);
      // print('Response body==>${response.body.toString()}');
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  setupIntentClientSecret:
                      'sk_test_51MYWo1SACSY9YeDvqWHShqO93RlRfUGt5sNT70IaQFHZgtqOAV5yPVW4fLTVNAoXgMpuFsvAyPKqfR9lQ4Zj4OBV00KoOp20nB',
                  paymentIntentClientSecret:
                      paymentIntentData!['client_secret'],
                  //applePay: PaymentSheetApplePay.,
                  //googlePay: true,
                  //testEnv: true,
                  customFlow: true,
                  style: ThemeMode.dark,
                  // merchantCountryCode: 'US',
                  merchantDisplayName: 'Ausaf'))
          .then((value) {});

      ///now finally display payment sheeet
      displayPaymentSheet();
    } catch (e, s) {
      print('Payment exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance
          .presentPaymentSheet(
              //       parameters: PresentPaymentSheetParameters(
              // clientSecret: paymentIntentData!['client_secret'],
              // confirmPayment: true,
              // )
              )
          .then((newValue) {
        print('payment intent' + paymentIntentData!['id'].toString());
        print(
            'payment intent' + paymentIntentData!['client_secret'].toString());
        print('payment intent' + paymentIntentData!['amount'].toString());
        print('payment intent' + paymentIntentData.toString());
        //orderPlaceApi(paymentIntentData!['id'].toString());
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("paid successfully")));

        paymentIntentData = null;
      }).onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount('20'),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      print(body);
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer ' + 'your token',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}
