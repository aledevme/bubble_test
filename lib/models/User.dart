import 'dart:math';

class User {
  String name;
  String lastname;
  String profilePicture;
  List<int> colors;

  User(
      {required this.name,
      required this.lastname,
      required this.profilePicture,
      required this.colors});

  double colorDistance(List<int> a, List<int> b) {
    double sum = 0.0;
    for (int i = 0; i < a.length; i++) {
      sum += pow(a[i] - b[i], 2);
    }
    return sqrt(sum);
  }

  static List<User> sortUsersByColor(List<User> users) {
    users.sort((a, b) {
      var distanceA = a.colorDistance(a.colors, b.colors);
      var distanceB = b.colorDistance(a.colors, b.colors);
      return distanceA.compareTo(distanceB);
    });
    return users;
  }
}
