abstract class IPreferencesRepository {
  void setLoginStatus(bool loginValue);

  Future<bool> isLogged();
}
