import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app_pkg.dart';
import 'package:get/get.dart';

class ArticleView extends GetView<ArticleController> {
  const ArticleView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "সময়রেখা", showNotification: true,centerTitle: true,),
      body: ArticleBody()
    );
  }
}
