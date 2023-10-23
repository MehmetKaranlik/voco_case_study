enum NetworkPaths {
  users('api/users'),
  login('api/login');

  final String path;
  const NetworkPaths(this.path);
  static const _baseUrl = 'reqres.in';
  static const _schema = "https";

  Uri get uri => Uri(
        scheme: _schema,
        host: _baseUrl,
        path: path,
      );
}
