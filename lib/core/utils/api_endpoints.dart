class ApiEndPoints {
  static final String baseUrl = 'https://api-hp.viettelsoftware.com:8443/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'v1/registration';
  final String login = 'v1/login';
}