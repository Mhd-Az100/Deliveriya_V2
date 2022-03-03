class UnbordingContent {
  String? image;
  String? title;
  String? discription;

  UnbordingContent({this.image, this.title, this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Order all the products you need',
      image: 'assets/images/onboarding1.svg',
      discription:
          "You will find all the products you want in this application and also order them "),
  UnbordingContent(
      title: 'And We will deliver it to you wherever you are!',
      image: 'assets/images/onboarding2.svg',
      discription:
          "Our mission is to deliver these products to you wherever you are"),
  UnbordingContent(
      title: 'Save you monye with our offers up to 20%',
      image: 'assets/images/onboarding3.svg',
      discription:
          "Save your money and get the discounts we offer on our products"),
];
