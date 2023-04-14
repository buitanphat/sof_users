// App const

class AppConfig {
  static const isProductionEnv = false;
}

class LocalStorageKey {
  static const sofUserList = '';
}

class ApiUrl {
  static const baseUrl = AppConfig.isProductionEnv
      ? 'https://api.stackexchange.com'
      : 'https://api.stackexchange.com';

  static const sofUserListUrl = '$baseUrl/2.2/users';
  static const sofUserReputationUrl = '$baseUrl/2.2/users';
}
