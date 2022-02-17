class FeedbackForm {
  String name;
  String email;
  String topic;
  String description;

  FeedbackForm(this.name, this.email, this.topic, this.description);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm("${json['name']}", "${json['email']}",
        "${json['topic']}", "${json['description']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
    'name': name,
    'email': email,
    'topic': topic,
    'description': description
  };
}