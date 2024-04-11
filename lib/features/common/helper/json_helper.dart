class JsonHelper {
  JsonHelper._();

  static dynamic safeParse(Map<String, dynamic> json, String key) {
    try {
      if (json[key] != null) {
        return json[key];
      }
      throw Exception();
    } catch (e) {
      throw Exception("Error parsing field '$key': $e");
    }
  }
}
