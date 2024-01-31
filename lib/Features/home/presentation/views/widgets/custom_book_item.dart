import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class CustomBookImage extends StatelessWidget {
  final String? img;
  const CustomBookImage({Key? key, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: (img != '')
              ? CachedNetworkImage(
                  imageUrl: img!,
                  fit: BoxFit.fill,
                )
              : Image.asset(
                  AssetsData.logo,
                )),
    );
  }
}
