// To parse this JSON data, do
//
//     final bundlePackageResponse = bundlePackageResponseFromMap(jsonString);

import 'dart:convert';

List<BundlePackageResponse> bundlePackageResponseFromMap(dynamic str) => List<BundlePackageResponse>.from((str as List<dynamic>).map((x) => BundlePackageResponse.fromMap(x)));

String bundlePackageResponseToMap(List<BundlePackageResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class BundlePackageResponse {
  final int? id;
  final String? packageName;
  final String? packagePrice;
  final String? discountAmount;
  final List<PackageQuestion>? packageQuestions;

  BundlePackageResponse({
    this.id,
    this.packageName,
    this.packagePrice,
    this.discountAmount,
    this.packageQuestions,
  });

  factory BundlePackageResponse.fromMap(Map<String, dynamic> json) => BundlePackageResponse(
    id: json["id"],
    packageName: json["package_name"],
    packagePrice: json["package_price"],
    discountAmount: json["discount_amount"],
    packageQuestions: json["package_questions"] == null ? [] : List<PackageQuestion>.from(json["package_questions"]!.map((x) => PackageQuestion.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "package_name": packageName,
    "package_price": packagePrice,
    "discount_amount": discountAmount,
    "package_questions": packageQuestions == null ? [] : List<dynamic>.from(packageQuestions!.map((x) => x.toMap())),
  };
}

class PackageQuestion {
  final int? questionSetId;
  final String? questionType;
  final String? questionSetName;
  final int? questionLevelId;
  final String? questionLevelName;
  final dynamic topicId;
  final dynamic topicName;
  final String? price;
  final bool? isPaid;
  final String? readingQuestions;
  final String? readingTime;
  final String? listeningQuestions;
  final String? listeningTime;
  final String? passMarks;
  final String? totalMarks;
  final bool? isPurchased;

  PackageQuestion({
    this.questionSetId,
    this.questionType,
    this.questionSetName,
    this.questionLevelId,
    this.questionLevelName,
    this.topicId,
    this.topicName,
    this.price,
    this.isPaid,
    this.readingQuestions,
    this.readingTime,
    this.listeningQuestions,
    this.listeningTime,
    this.passMarks,
    this.totalMarks,
    this.isPurchased,
  });

  factory PackageQuestion.fromMap(Map<String, dynamic> json) => PackageQuestion(
    questionSetId: json["question_set_id"],
    questionType: json["question_type"],
    questionSetName: json["question_set_name"],
    questionLevelId: json["question_level_id"],
    questionLevelName: json["question_level_name"],
    topicId: json["topic_id"],
    topicName: json["topic_name"],
    price: json["price"],
    isPaid: json["is_paid"],
    readingQuestions: json["reading_questions"],
    readingTime: json["reading_time"],
    listeningQuestions: json["listening_questions"],
    listeningTime: json["listening_time"],
    passMarks: json["pass_marks"],
    totalMarks: json["total_marks"],
    isPurchased: json["is_purchased"],
  );

  Map<String, dynamic> toMap() => {
    "question_set_id": questionSetId,
    "question_type": questionType,
    "question_set_name": questionSetName,
    "question_level_id": questionLevelId,
    "question_level_name": questionLevelName,
    "topic_id": topicId,
    "topic_name": topicName,
    "price": price,
    "is_paid": isPaid,
    "reading_questions": readingQuestions,
    "reading_time": readingTime,
    "listening_questions": listeningQuestions,
    "listening_time": listeningTime,
    "pass_marks": passMarks,
    "total_marks": totalMarks,
    "is_purchased": isPurchased,
  };
}
