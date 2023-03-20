import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../size_config.dart';

class CustomSuffixIcon extends StatelessWidget {
  const CustomSuffixIcon({
    Key? key,
    required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        20 / 375 * MediaQuery.of(context).size.width,
        20 / 375 * MediaQuery.of(context).size.width,
        20 / 375 * MediaQuery.of(context).size.width,
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: 18 / 812 * MediaQuery.of(context).size.height,
      ),
    );
  }
}
