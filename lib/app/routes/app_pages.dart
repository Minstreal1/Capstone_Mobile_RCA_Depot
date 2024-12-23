import 'package:get/get.dart';

import '../modules/calendar-detail/bindings/calendar_detail_binding.dart';
import '../modules/calendar-detail/views/calendar_detail_view.dart';
import '../modules/config_material/bindings/config_material_binding.dart';
import '../modules/config_material/views/config_material_view.dart';
import '../modules/google-map-autocomplete/bindings/google_map_autocomplete_binding.dart';
import '../modules/google-map-autocomplete/views/google_map_autocomplete_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/manage-material/bindings/manage_material_binding.dart';
import '../modules/manage-material/views/manage_material_view.dart';
import '../modules/payment_detail/bindings/payment_detail_binding.dart';
import '../modules/payment_detail/views/payment_detail_view.dart';
import '../modules/personal_info/bindings/personal_info_binding.dart';
import '../modules/personal_info/views/personal_info_view.dart';
import '../modules/schedule-detail/bindings/schedule_detail_binding.dart';
import '../modules/schedule-detail/views/schedule_detail_view.dart';
import '../modules/send-point/bindings/send_point_binding.dart';
import '../modules/send-point/views/send_point_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/tab-calendar/bindings/tab_calendar_binding.dart';
import '../modules/tab-calendar/views/tab_calendar_view.dart';
import '../modules/tab_account/bindings/tab_account_binding.dart';
import '../modules/tab_account/views/tab_account_view.dart';
import '../modules/tab_history/bindings/tab_history_binding.dart';
import '../modules/tab_history/views/tab_history_view.dart';
import '../modules/tab_home/bindings/tab_home_binding.dart';
import '../modules/tab_home/views/tab_home_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.TAB_ACCOUNT,
      page: () => const TabAccountView(),
      binding: TabAccountBinding(),
    ),
    GetPage(
      name: _Paths.TAB_HOME,
      page: () => const TabHomeView(),
      binding: TabHomeBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_INFO,
      page: () => const PersonalInfoView(),
      binding: PersonalInfoBinding(),
    ),
    GetPage(
      name: _Paths.TAB_CALENDAR,
      page: () => const TabCalendarView(),
      binding: TabCalendarBinding(),
    ),
    GetPage(
      name: _Paths.TAB_HISTORY,
      page: () => const TabHistoryView(),
      binding: TabHistoryBinding(),
    ),
    GetPage(
      name: _Paths.CALENDAR_DETAIL,
      page: () => const CalendarDetailView(),
      binding: CalendarDetailBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_DETAIL,
      page: () => const PaymentDetailView(),
      binding: PaymentDetailBinding(),
    ),
    GetPage(
      name: _Paths.SCHEDULE_DETAIL,
      page: () => const ScheduleDetailView(),
      binding: ScheduleDetailBinding(),
    ),
    GetPage(
      name: _Paths.GOOGLE_MAP_AUTOCOMPLETE,
      page: () => const GoogleMapAutocompleteView(),
      binding: GoogleMapAutocompleteBinding(),
    ),
    GetPage(
      name: _Paths.CONFIG_MATERIAL,
      page: () => const ConfigMaterialView(),
      binding: ConfigMaterialBinding(),
    ),
    GetPage(
      name: _Paths.MANAGE_MATERIAL,
      page: () => const ManageMaterialView(),
      binding: ManageMaterialBinding(),
    ),
    GetPage(
      name: _Paths.SEND_POINT,
      page: () => const SendPointView(),
      binding: SendPointBinding(),
    ),
  ];
}
