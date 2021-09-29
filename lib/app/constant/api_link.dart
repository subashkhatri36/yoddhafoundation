class Api {
  static const String shaidInsert = '';
  //for login
  static const String login='http://yoddha-foundation.dev-stage.xyz/api/auth/login';
  final loginbody={'email':'bjr.sudeep@gmail.com','password':'password'};

  //for user
  static const String user='http://yoddha-foundation.dev-stage.xyz/api/auth/me';
  final userheader='';

  //logout
  static  const String logout='http://yoddha-foundation.dev-stage.xyz/api/auth/logout';

  //insert shaid
  static const String insertSahid='http://yoddha-foundation.dev-stage.xyz/api/sahids/';
  
  //update or edit shaid data
  static const String updateSahid='http://yoddha-foundation.dev-stage.xyz/api/sahids/5';

  //getting shaid detail
  static const String getSahid='http://yoddha-foundation.dev-stage.xyz/api/sahids/5';//get

  //


}
