
List<FAQSection> faqModelFromJson(dynamic str) => List<FAQSection>.from((str as List<dynamic>).map((x) => FAQSection.fromJson(x)));

class FAQSection {
  String? title;
  List<FAQItem>? data;

  FAQSection({
    this.title,
    this.data,
  });

  factory FAQSection.fromJson(Map<String, dynamic> json) => FAQSection(
    title: json["title"],
    data: json["data"] == null ? [] : List<FAQItem>.from(json["data"]!.map((x) => FAQItem.fromJson(x))),
  );

}

class FAQItem {
  String? question;
  String? answer;

  FAQItem({
    this.question,
    this.answer,
  });

  factory FAQItem.fromJson(Map<String, dynamic> json) => FAQItem(
    question: json["question"],
    answer: json["answer"],
  );

}
