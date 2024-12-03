class BaseLink {
  static String domain = 'https://clownfish-app-wvth5.ondigitalocean.app';
  static String register = '$domain/auth/register/resident';
  static String login = '$domain/auth/login';

  static String fetchListMaterial = '$domain/material/get-all-material';
  static String fetchListScheduleByStatus = '$domain/recycling-depot/get-list-payment';
  static String fetchListScheduleUserByStatus = '$domain/recycling-depot/get-list-payment';
  
  static String regisSchdule = '$domain/collector/accept-colecttion-schedule-by-id';
  static String fetchScheduleById = '$domain/schedule/get-schedule-by-id';

  static String createQrPayment = '$domain/recycling-depot/create-recycling-depot-payment';

  static String scheduleDetailById = '$domain/schedule/get-schedule-by-id';
  static String paymentDetailByScheduleId = '$domain/collector/get-payment-cr-by-schedule-id';

}