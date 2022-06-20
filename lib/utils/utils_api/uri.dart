
class URI {
    static const Uri = "http://192.168.0.102:3000";
    // static const Uri = "http://172.16.0.8:3000";
 // static const Uri = "http://naeebaslan.com:3000";
// static const Uri = "http://naeebaslan.com:3000";فتح التطبيق مجان عبر الشبكة
// static const Uri = "http://7444062152f2.sn.mynetname.net:250";// فتح التطبيق مجان عبر البيانات

  static const REGISTER_URI = ('$Uri/user/register');
  static const DETAILS_USER = ('$Uri/user/DetailsUser');
  static const LOGIN = ('$Uri/user/login');
  static const CREATE_NETWORK = ('$Uri/network/CreateNetwork');
  static const COVERAGE_AREA = ('$Uri/area/CoverageAreaNetwork');
  static const PROFILE_URI = ('$Uri/user/profile/60d793688d990525483d3193');
  // static const GOVERNORATE = ('$Uri/area');
  static const GOVERNORATE = ('$Uri/location');
  static const CITY = ('$Uri/location/City/idGovernorate?idGovernorate=');
  static const STREET = ('$Uri/location/Street/GovernorateId?GovernorateId=');
  
  static const int StatusCode = 200;
}



