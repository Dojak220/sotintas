abstract class UserRepository {
  Future<String> getUserToken(String login, String password);
  Future<Map<String, String>> getUserProfile();
}
