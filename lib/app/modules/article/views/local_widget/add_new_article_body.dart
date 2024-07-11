
import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app_pkg.dart';
import 'package:flutter_assignment/app/core/utils/helpers/validate_check.dart';
import 'package:flutter_assignment/app/global_widgets/custom_text_field.dart';
import 'package:get/get.dart';

class AddNewArticleBody extends StatefulWidget {
  const AddNewArticleBody({super.key});

  @override
  State<AddNewArticleBody> createState() => _AddNewArticleBodyState();
}

class _AddNewArticleBodyState extends State<AddNewArticleBody> {
  final paragraphCon = TextEditingController();
  final dateCon = TextEditingController();
  final paragraphDescriptionCon = TextEditingController();
  final paragraphsCategory = TextEditingController();
  final districtCon = TextEditingController();
  int? unixTimestamp;
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    paragraphCon.dispose();
    dateCon.dispose();
    paragraphDescriptionCon.dispose();
    paragraphsCategory.dispose();
    districtCon.dispose();
    unixTimestamp = null;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArticleController>(
      builder: (controller) {
        return Form(
          key: formKey,
          child: ListView(
            padding: Dimens.pagePadding,
            children:  [
              CustomTextField(
                title: "অনুচ্ছেদ", subTitle: "৪৫ শব্দ", hintText: "অনুচ্ছেদ লিখুন",
                maxLength: 45,
                controller: paragraphCon,
                validator: (value) => ValidateCheck.validateEmptyText(value, "অনুচ্ছেদ লিখুন"),
              ),

              Dimens.spaceH20,
               CustomDropdownMenu(
                   title: "অনুচ্ছেদের বিভাগ",
                   hintText: "অনুচ্ছেদের বিভাগ নির্বাচন করুন",
                   controller: paragraphsCategory,
                   onSelected: (value) => paragraphsCategory.text = value??"",
                   dropdownMenuItems: controller.paragraphsCategory.map((location) =>  DropdownMenuEntry(value: location, label: location,)).toList()),

              Dimens.spaceH20,
              CustomTextField(
                title: "তারিখ ও সময়", hintText: "নির্বাচন করুন",
                readOnly: true,
                controller: dateCon,
                prefixIcon: AssetsConstants.calendarOutlineIcon,
                prefixIconColor: ColorConstants.gray300Color,
                prefixIconSize: 16, suffixIcon: AssetsConstants.altArrowRightIcon,
                onTap: () async{
                  String? date =  await AppHelper.datePickerShow();
                  DateTime? dateTime = DateTime.tryParse(date??"");
                  DateTime dateTimeNow = DateTime.now();
                  dateTimeNow = dateTimeNow.copyWith(day: dateTime?.day,month:dateTime?.month,year: dateTime?.year);
                  unixTimestamp = dateTimeNow.millisecondsSinceEpoch ~/ 1000;
                  dateCon.text = date??"";
                },
                validator: (value) => ValidateCheck.validateEmptyText(value, "তারিখ ও সময় নির্বাচন করুন"),
              ),

              Dimens.spaceH20,
              CustomDropdownMenu(
                  title: "স্থান",
                  hintText: "নির্বাচন করুন",
                  leadingIcon: AssetsConstants.mapPointIcon,
                  controller: districtCon,
                  onSelected: (value) => districtCon.text = value??"",
                  dropdownMenuItems: controller.districtList.map((location) =>  DropdownMenuEntry(value: location, label: location,)).toList()),

              Dimens.spaceH20,
               CustomTextField(
                title: "অনুচ্ছেদের বিবরণ", subTitle: "১২০ শব্দ",
                controller: paragraphDescriptionCon,
                hintText: "কার্যক্রমের বিবরণ লিখুন",
                maxLines: 8, maxLength: 120,
                validator: (value) => ValidateCheck.validateEmptyText(value, "কার্যক্রমের বিবরণ লিখুন"),
              ),

              Dimens.spaceH20,
              CustomButton(
                  onTap: () {
                    if(formKey.currentState!.validate()){
                      if(paragraphsCategory.text.isEmpty){
                        AppHelper.snackBarForError(bodyText: "অনুচ্ছেদের বিভাগ নির্বাচন করুন");
                      }else if(districtCon.text.isEmpty){
                        AppHelper.snackBarForError(bodyText: "স্থান নির্বাচন করুন");
                      }else {
                        controller.addNewArticle(ItemModel(
                          name: paragraphDescriptionCon.text,
                          category: paragraphsCategory.text,
                          date: unixTimestamp.toString(),
                          location: "${districtCon.text}, বাংলাদেশ"
                        )).then((value) {
                          paragraphCon.clear();
                          dateCon.clear();
                          paragraphDescriptionCon.clear();
                          paragraphsCategory.clear();
                          districtCon.clear();
                          unixTimestamp = null;
                          formKey.currentState?.reset();
                        });
                      }
                    }
                  },
                  borderRadius: BorderRadius.circular(8),
                  text: "সংরক্ষন করুন")


            ],
          ),
        );
      }
    );
  }
}


