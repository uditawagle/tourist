
class Feedback{
  final int uid;
  final String email;
  final String rate;
  final String feedbacks;

  Feedback({
    required this.uid,
    required this.email,
    required this.rate,
    required this.feedbacks,
  });
}

class login{
  final String email;
  final String password;

  login({
    required this.email,
    required this.password
  });
}