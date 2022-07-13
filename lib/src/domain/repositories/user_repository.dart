abstract class UserRepository {
  Future<String> getUserToken(String login, String password);
}
