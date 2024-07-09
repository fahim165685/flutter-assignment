import 'package:flutter/material.dart';

class CustomLoaderWidget extends StatelessWidget {
  const CustomLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        // child: SpinKitCircle(
        //   color: AppColors.primaryColor,
        //   size: 50.0,
        // )
      child: Text("Loading......"),
    );
  }
}