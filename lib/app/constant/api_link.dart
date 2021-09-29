class Api {
  static const String shaidInsert = '';
  //for login
  static const String login =
      'http://yoddha-foundation.dev-stage.xyz/api/auth/login';
 

  //for user
  static const String user =
      'http://yoddha-foundation.dev-stage.xyz/api/auth/me';
  final userheader = '';

  //logout
  static const String logout =
      'http://yoddha-foundation.dev-stage.xyz/api/auth/logout';

  //insert shaid
  static const String insertSahid =
      'http://yoddha-foundation.dev-stage.xyz/api/sahids/';

  //update or edit shaid data
  static const String updateSahid =
      'http://yoddha-foundation.dev-stage.xyz/api/sahids/5';

  //getting shaid detail
  static const String getSahid =
      'http://yoddha-foundation.dev-stage.xyz/api/sahids/5'; //get

  //save family
  static const String insertfamily =
      'http://yoddha-foundation.dev-stage.xyz/api/sahid/5/family/store';

  //update family
  static const String updateFamily =
      'http://yoddha-foundation.dev-stage.xyz/api/sahid/5/family/update/1';

  //get family info
  static const String getfamily =
      'http://yoddha-foundation.dev-stage.xyz/api/sahid/5/family/2';

  //children insert
  static const String insertchildren =
      'http://yoddha-foundation.dev-stage.xyz/api/sahid/5/children/store';

  //update children
  static const String updateChildren =
      'http://yoddha-foundation.dev-stage.xyz/api/sahid/5/children/update/1';

  //get children
  static const String getChildren =
      'http://yoddha-foundation.dev-stage.xyz/api/sahid/5/children/1';
}
