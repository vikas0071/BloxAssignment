import 'dart:async';

class ApiCaller {
  final int maxRequestsPerMinute = 15;
  final int penaltyDuration = 60; // 60 seconds (1 minute) penalty for crossing the limit
  int tokens = 0;
  int lastRefillTime = 0;

  Future<String> callApi(String input) async {
    // Refill tokens if needed
    int currentTime = DateTime.now().second;
    int timeSinceLastRefill = currentTime - lastRefillTime;
    if (timeSinceLastRefill >= 60) {
      // Reset tokens after penalty duration
      tokens = maxRequestsPerMinute;
      lastRefillTime = currentTime;
    } else {
      // Refill tokens based on time elapsed since last refill
      int tokensToAdd = (timeSinceLastRefill * maxRequestsPerMinute) ~/ 60;
      tokens = (tokens + tokensToAdd).clamp(0, maxRequestsPerMinute);
    }

    // Check if there are available tokens to make the API call
    if (tokens > 0) {
      tokens--;
      return await _makeApiCall(input);
    } else {
      // Implement handling for exceeding the safe limit here, like waiting for tokens to be available
      // or logging the rejection of the API call.
      return 'API call limit exceeded. Please wait for the next minute.';
    }
  }

  // Simulate the actual API call (replace with the actual implementation)
  Future<String> _makeApiCall(String input) async {
    await Future.delayed(Duration(seconds: 1));
    return 'API response for input: $input';
  }
}

void main() async {
  ApiCaller apiCaller = ApiCaller();

  for (int i = 1; i <= 20; i++) {
    String response = await apiCaller.callApi('Input $i');
    print(response);
  }
}
