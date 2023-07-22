import 'dart:convert';

// Function to parse a JSON string into a dynamic object, list, or map.
dynamic parseJsonString(String jsonString) {
  return jsonDecode(jsonString);
}

void main() {
  String jsonString = '{"name": "John", "age": 30, "isStudent": true}';

  dynamic parsedJson = parseJsonString(jsonString);

  // Accessing values from the parsed JSON
  print(parsedJson['name']); // Output: John
  print(parsedJson['age']); // Output: 30
  print(parsedJson['isStudent']); // Output: true
}
