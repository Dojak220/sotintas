abstract class IGetUser {
  Future<String> call(String email, String password);
}
