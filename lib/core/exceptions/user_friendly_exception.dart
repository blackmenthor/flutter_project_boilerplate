// This interface is created so that every exception thrown by ourselves can be identified as a UserFriendlyException
// This lets us handle all of our exceptions as one, but also cast to a specific exception in case it is needed
abstract class UserFriendlyException implements Exception {
  String getUserFriendlyMessage();
  int getCode();

  @override
  String toString() {
    return getUserFriendlyMessage();
  }
}
