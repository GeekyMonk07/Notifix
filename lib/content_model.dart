class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'GLBITM',
      image: 'assets/images/welcome.json',
      discription: "Find Your Spark"),
  UnbordingContent(
      title: 'Notifications',
      image: 'assets/images/HomeScreenAnimation.json',
      discription: "Get notified everytime something happens in College."),
  UnbordingContent(
      title: 'Convinient',
      image: 'assets/images/55964-college-student-jumping.json',
      discription:
          "Everything at your fingertips. Your one stop app for all your Technical needs."),
];
