class AuthService {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  void login() {
    _isAuthenticated = true;
    // await _saveAuthState(true);
  }

  void logout() {
    _isAuthenticated = false;
    // await _saveAuthState(false);
  }

  Future<void> init() async {
    // _isAuthenticated = await _loadAuthState();
  }
}

final authService = AuthService();