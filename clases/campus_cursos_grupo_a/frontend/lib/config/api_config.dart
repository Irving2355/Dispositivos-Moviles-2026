class ApiConfig {
  const ApiConfig._();

  static const String baseUrl = 
  String.fromEnvironment(
    'API_URL',
    defaultValue: 
    'http://localhost:3000/api',
  );
}
