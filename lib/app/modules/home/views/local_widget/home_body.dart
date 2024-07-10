import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app_pkg.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: Dimens.pagePadding.copyWith(top: Dimens.space24),
      children: [
        const HomePageProfileWidget(),

        Dimens.spaceH20,
        const HomeDurationWidget(),

        Dimens.spaceH20,
        const HomeMenuWidget(),

      ],
    );
  }
}



