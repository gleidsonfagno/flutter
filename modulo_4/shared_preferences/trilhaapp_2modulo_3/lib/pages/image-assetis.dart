// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:trilhaapp/shared/widgets/app_images.dart';

class ImageAssetisPage extends StatefulWidget {
  const ImageAssetisPage({super.key});

  @override
  State<ImageAssetisPage> createState() => _ImageAssetisPageState();
}

class _ImageAssetisPageState extends State<ImageAssetisPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.user1,
          height: 50,
        ),
        Image.asset(
          AppImages.user1,
          height: 50,
        ),
        Image.asset(
          AppImages.user3,
          height: 50,
        ),
        Image.asset(
          AppImages.paisagem1,
          height: 200,
          width: double.infinity,
        ),
        Image.asset(
          AppImages.paisagem2,
          height: 50,
          width: double.infinity,
        ),
        Image.asset(
          AppImages.paisagem3,
          height: 50,
        ),

        // Image.asset("lib/images/diablo-bg.png")
        // Container(
        //   color: Colors.indigo,
        // ),
      ],
    );
  }
}
