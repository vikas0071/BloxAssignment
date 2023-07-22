class SessionIdGenerator {
  final int maxSessionId = 4294967295; // Maximum 32-bit integer value
  int currentSessionId = 0;

  int getUniqueSessionId() {
    // Loop through available session ids until an unused one is found
    while (true) {
      if (currentSessionId > maxSessionId) {
        currentSessionId = 0;
      }

      // Check if the session id is available (not assigned to any active user)
      // In a real implementation, you would check a bitmap or bitset for availability.
      // For this example, we are using a simple list to demonstrate the concept.
      if (!_isSessionIdAssigned(currentSessionId)) {
        int sessionId = currentSessionId;
        currentSessionId++;
        return sessionId;
      }

      currentSessionId++;
    }
  }

  void releaseSessionId(int sessionId) {
    // Release the session id to make it available for reuse.
    // In a real implementation, you would set the corresponding bit in the bitmap to 0.
    // For this example, we are using a simple list to demonstrate the concept.
    _markSessionIdAsAvailable(sessionId);
  }

  // Dummy methods for demonstration purposes.
  bool _isSessionIdAssigned(int sessionId) {
    // In a real implementation, this method would check the bitmap to determine if the session id is assigned.
    return false;
  }

  void _markSessionIdAsAvailable(int sessionId) {
    // In a real implementation, this method would update the bitmap to mark the session id as available.
  }
}

void main() {
  SessionIdGenerator sessionIdGenerator = SessionIdGenerator();

  for (int i = 0; i < 10; i++) {
    int sessionId = sessionIdGenerator.getUniqueSessionId();
    print("Assigned Session ID: $sessionId");
    // Simulate session expiration after some time
    // For demonstration purposes, we will release the session id immediately after generating it.
    sessionIdGenerator.releaseSessionId(sessionId);
  }
}
