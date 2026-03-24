class AppLink {
  static const String server = "http://127.0.0.1:8000/";
  static const String test = "$server";

  /////// ================ Auth ================================= ///

  static const String issueDecision = "${server}api/admin/issue-decision";
  static const String signup = "https://reqres.in/api/users";
  static const String verifyCodeSignUp = "https://reqres.in/api/users";
  static const String login = "${server}api/admin_login";
  static const String adduser = "${server}api/user_register";
  static const String loginmanager = "${server}api/user_login";

  /// ForgetPassword
  static const String checkemail = "${server}api/admin/password/email";
  static const String resetpassword = "${server}api/admin/password/reset";
  static const String verifycodeforgetpassword =
      "${server}api/admin/password/code/check";

////////////

///////////////////// mosque
  static const String allmosque = "${server}api/admin/mosques";
  static const String addmosque = "${server}api/admin/mosques";
  static const String editmosque = "${server}api/admin/mosques";
  static const String deletmosque = "${server}api/admin/mosques";
  static const String searchByCategory = "${server}api/admin/searchByCategory";
  static const String searchByName = "${server}api/admin/searchByName";
  static const String archiveMosque = "${server}api/admin/ViewDelate";

  /////////////// manager
  static const String allmanager = "${server}api/admin/index1";
  static const String addmanager = "${server}api/admin/addMosqueManager";
  static const String editmanager = "${server}api/admin/updateMosqueManager";
  static const String deletmanager = "${server}api/admin/mosque-managers";
  static const String archiveManager =
      "${server}api/admin/archivedMosqueManagers";
  static const String restorearchive =
      "${server}api/admin/restoreMosqueManager";
  static const String getstaff = "${server}api/admin/getMosqueStaff";

  ////////// Requset
  static const String getRequest = "${server}api/admin/admin/requests";

  ////////////// complaints
  static const String getComplaint = "${server}api/admin/veiwComplaint";

/////////////////// duration
  static const String AddDuration = "${server}api/admin/StoreSchedul";
  static const String ViewDuration = "${server}api/admin/ViewSchedul";
  static const String editDuration = "${server}api/admin/updateSchedul";
  static const String deletDuration = "${server}api/admin/deletSchedul";


}
