import 'package:flutter/material.dart';
import 'package:gdsc_client/components/svg_asset.dart';
import 'package:gdsc_client/size_config.dart';

import '../icons.dart';

class DiscoverSmallCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Color? gradientStartColor;
  final Color? gradientEndColor;
  final double? height;
  final double? width;
  final Widget? vectorBottom;
  final Widget? vectorTop;
  final double? borderRadius;
  final Widget? icon;
  final Function()? onTap;
  const DiscoverSmallCard(
      {Key? key,
      this.title,
      this.subtitle,
      this.gradientStartColor,
      this.gradientEndColor,
      this.height,
      this.width,
      this.vectorBottom,
      this.vectorTop,
      this.borderRadius,
      this.icon,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap ?? () {},
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              gradientStartColor ?? const Color(0xff441DFC),
              gradientEndColor ?? const Color(0xff4E81EB),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Stack(
          children: [
            SizedBox(
              height: 125 / 375 * MediaQuery.of(context).size.width,
              width: 150 / 375 * MediaQuery.of(context).size.width,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 125 / 375 * MediaQuery.of(context).size.width,
                width: 150 / 375 * MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 125 / 375 * MediaQuery.of(context).size.width,
                      width: 150 / 375 * MediaQuery.of(context).size.width,
                      child: const SvgAsset(
                          assetName: AssetName.vectorSmallBottom),
                    ),
                    SizedBox(
                      child: SvgAsset(
                          height: 125 / 375 * MediaQuery.of(context).size.width,
                          width: 150 / 375 * MediaQuery.of(context).size.width,
                          fit: BoxFit.fitHeight,
                          assetName: AssetName.vectorSmallTop),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 125 / 375 * MediaQuery.of(context).size.width,
              width: 150 / 375 * MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 20 / 375 * MediaQuery.of(context).size.width,
                    top: 20 / 375 * MediaQuery.of(context).size.width,
                    bottom: 20 / 375 * MediaQuery.of(context).size.width),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title!,
                      style: TextStyle(
                          fontSize:
                              18 / 375 * MediaQuery.of(context).size.width,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Row(
                      children: [
                        icon ??
                            SvgAsset(
                              assetName: AssetName.headphone,
                              height:
                                  24 / 375 * MediaQuery.of(context).size.width,
                              width:
                                  24 / 375 * MediaQuery.of(context).size.width,
                            ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
