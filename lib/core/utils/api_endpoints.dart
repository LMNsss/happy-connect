class ApiEndPoints {
  static final String baseUrl = 'https://checkin2.viettel-softwareservices.vn:9091/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'v1/registration';
  final String login = 'v1/login';
}