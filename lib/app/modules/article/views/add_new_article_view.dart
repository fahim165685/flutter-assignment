import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app_pkg.dart';

class AddNewArticleView extends StatelessWidget {
  const AddNewArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "নতুন যোগ করুন", showBackButton: true,centerTitle: true,),
      body: AddNewArticleBody(),
    );
  }
}
