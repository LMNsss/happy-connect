class ApiEndPoints {
  static const String baseUrl = 'https://api-hp.viettelsoftware.com:8443/api/v1/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'registration';
  final String login = 'login';
}