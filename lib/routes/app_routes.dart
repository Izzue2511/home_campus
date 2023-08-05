import 'package:flutter/material.dart';
import 'package:homecampus/presentation/saved_page/saved_page.dart';
import 'package:homecampus/presentation/scheduled_status_page/scheduled_status_page.dart';
import 'package:homecampus/presentation/splash_screen/splash_screen.dart';
import 'package:homecampus/presentation/write_review_screen/write_review_screen.dart';
import 'package:homecampus/presentation/attach_screen/attach_screen.dart';
import 'package:homecampus/presentation/video_call_screen/video_call_screen.dart';
import 'package:homecampus/presentation/notification_delete_screen/notification_delete_screen.dart';
import 'package:homecampus/presentation/profile_edit_house_owner_screen/profile_edit_house_owner_screen.dart';
import 'package:homecampus/presentation/home_location_screen/home_location_screen.dart';
import 'package:homecampus/presentation/schedule_date_screen/schedule_date_screen.dart';
import 'package:homecampus/presentation/schedule_visit_details_student_screen/schedule_visit_details_student_screen.dart';
import 'package:homecampus/presentation/reschedule_visit_student_screen/reschedule_visit_student_screen.dart';
import 'package:homecampus/presentation/reschedule_date_student_screen/reschedule_date_student_screen.dart';
import 'package:homecampus/presentation/search_screen/search_screen.dart';
import 'package:homecampus/presentation/filter_screen/filter_screen.dart';
import 'package:homecampus/presentation/review_screen/review_screen.dart';
import 'package:homecampus/presentation/chat_screen/chat_screen.dart';
import 'package:homecampus/presentation/schedule_visit_confirmed_student_screen/schedule_visit_confirmed_student_screen.dart';
import 'package:homecampus/presentation/schedule_visit_canceled_student_screen/schedule_visit_canceled_student_screen.dart';
import 'package:homecampus/presentation/schedule_visit_confirmed_owner_screen/schedule_visit_confirmed_owner_screen.dart';
import 'package:homecampus/presentation/schedule_visit_canceled_owner_screen/schedule_visit_canceled_owner_screen.dart';
import 'package:homecampus/presentation/chat_room_screen/chat_room_screen.dart';
import 'package:homecampus/presentation/camera_screen/camera_screen.dart';
import 'package:homecampus/presentation/audio_call_screen/audio_call_screen.dart';
import 'package:homecampus/presentation/profile_student_screen/profile_student_screen.dart';
import 'package:homecampus/presentation/two_foctor_authentication_student_screen/two_foctor_authentication_student_screen.dart';
import 'package:homecampus/presentation/home_student_screen/home_student_screen.dart';
import 'package:homecampus/presentation/home_admin_screen/home_admin_screen.dart';
import 'package:homecampus/presentation/details_house_screen/details_house_screen.dart';
import 'package:homecampus/presentation/admin_rental_property_details_screen/admin_rental_property_details_screen.dart';
import 'package:homecampus/presentation/details_house_share_screen/details_house_share_screen.dart';
import 'package:homecampus/presentation/schedule_visit_screen/schedule_visit_screen.dart';
import 'package:homecampus/presentation/scheduled_successfully_screen/scheduled_successfully_screen.dart';
import 'package:homecampus/presentation/scheduled_status_container_screen/scheduled_status_container_screen.dart';
import 'package:homecampus/presentation/login_student_screen/login_student_screen.dart';
import 'package:homecampus/presentation/login_admin_screen/login_admin_screen.dart';
import 'package:homecampus/presentation/register_student_screen/register_student_screen.dart';
import 'package:homecampus/presentation/otp_verification_student_screen/otp_verification_student_screen.dart';
import 'package:homecampus/presentation/otp_code_student_screen/otp_code_student_screen.dart';
import 'package:homecampus/presentation/student_verification_success_screen/student_verification_success_screen.dart';
import 'package:homecampus/presentation/student_forgot_password_screen/student_forgot_password_screen.dart';
import 'package:homecampus/presentation/student_email_otp_code_screen/student_email_otp_code_screen.dart';
import 'package:homecampus/presentation/new_password_student_screen/new_password_student_screen.dart';
import 'package:homecampus/presentation/student_password_changes_success_screen/student_password_changes_success_screen.dart';
import 'package:homecampus/presentation/welcome_user_screen/welcome_user_screen.dart';
import 'package:homecampus/presentation/login_house_owner_screen/login_house_owner_screen.dart';
import 'package:homecampus/presentation/register_house_owner_screen/register_house_owner_screen.dart';
import 'package:homecampus/presentation/register_admin_screen/register_admin_screen.dart';
import 'package:homecampus/presentation/otp_verification_screen/otp_verification_screen.dart';
import 'package:homecampus/presentation/otp_code_screen/otp_code_screen.dart';
import 'package:homecampus/presentation/verification_success_screen/verification_success_screen.dart';
import 'package:homecampus/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:homecampus/presentation/email_otp_code_screen/email_otp_code_screen.dart';
import 'package:homecampus/presentation/new_password_house_owner_screen/new_password_house_owner_screen.dart';
import 'package:homecampus/presentation/password_changes_success_screen/password_changes_success_screen.dart';
import 'package:homecampus/presentation/face_verification_screen/face_verification_screen.dart';
import 'package:homecampus/presentation/front_ic_card_screen/front_ic_card_screen.dart';
import 'package:homecampus/presentation/take_a_selfie_screen/take_a_selfie_screen.dart';
import 'package:homecampus/presentation/face_oval_screen/face_oval_screen.dart';
import 'package:homecampus/presentation/corect_face_one_screen/corect_face_one_screen.dart';
import 'package:homecampus/presentation/ic_verifying_screen/ic_verifying_screen.dart';
import 'package:homecampus/presentation/filter_screen_owner_screen/filter_screen_owner_screen.dart';
import 'package:homecampus/presentation/verying_owner_screen/verying_owner_screen.dart';
import 'package:homecampus/presentation/added_property_successfully_screen/added_property_successfully_screen.dart';
import 'package:homecampus/presentation/review_screen_owner_screen/review_screen_owner_screen.dart';
import 'package:homecampus/presentation/update_property_successfully_screen/update_property_successfully_screen.dart';
import 'package:homecampus/presentation/scheduled_requested_screen/scheduled_requested_screen.dart';
import 'package:homecampus/presentation/reschedule_date_screen/reschedule_date_screen.dart';
import 'package:homecampus/presentation/chat_delete_owner_screen/chat_delete_owner_screen.dart';
import 'package:homecampus/presentation/attach_owner_screen/attach_owner_screen.dart';
import 'package:homecampus/presentation/video_call_owner_screen/video_call_owner_screen.dart';
import 'package:homecampus/presentation/notification_owner_screen/notification_owner_screen.dart';
import 'package:homecampus/presentation/profile_house_owner_screen/profile_house_owner_screen.dart';
import 'package:homecampus/presentation/profile_admin_screen/profile_admin_screen.dart';
import 'package:homecampus/presentation/profile_edit_owner_screen/profile_edit_owner_screen.dart';
import 'package:homecampus/presentation/profile_edit_admin_screen/profile_edit_admin_screen.dart';
import 'package:homecampus/presentation/ic_verification_screen/ic_verification_screen.dart';
import 'package:homecampus/presentation/back_ic_card_screen/back_ic_card_screen.dart';
import 'package:homecampus/presentation/start_record_screen/start_record_screen.dart';
import 'package:homecampus/presentation/corect_face_screen/corect_face_screen.dart';
import 'package:homecampus/presentation/corect_face_two_screen/corect_face_two_screen.dart';
import 'package:homecampus/presentation/schedule_visit_details_screen/schedule_visit_details_screen.dart';
import 'package:homecampus/presentation/confirmed_scheduled_successfully_screen/confirmed_scheduled_successfully_screen.dart';
import 'package:homecampus/presentation/chat_owner_screen/chat_owner_screen.dart';
import 'package:homecampus/presentation/chat_room_owner_screen/chat_room_owner_screen.dart';
import 'package:homecampus/presentation/camera_owner_screen/camera_owner_screen.dart';
import 'package:homecampus/presentation/audio_call_owner_screen/audio_call_owner_screen.dart';
import 'package:homecampus/presentation/notification_delete_owner_screen/notification_delete_owner_screen.dart';
import 'package:homecampus/presentation/face_id_owner_screen/face_id_owner_screen.dart';
import 'package:homecampus/presentation/two_foctor_authentication_house_owner_screen/two_foctor_authentication_house_owner_screen.dart';
import 'package:homecampus/presentation/home_house_owner_screen/home_house_owner_screen.dart';
import 'package:homecampus/presentation/archive_home_house_owner_screen/archive_home_house_owner_screen.dart';
import 'package:homecampus/presentation/search_screen_owner_screen/search_screen_owner_screen.dart';
import 'package:homecampus/presentation/add_house_rental_screen/add_house_rental_screen.dart';
import 'package:homecampus/presentation/details_house_rental_screen/details_house_rental_screen.dart';
import 'package:homecampus/presentation/update_house_rental_screen/update_house_rental_screen.dart';
import 'package:homecampus/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {

  static const String mainPage = '/main_page';

  static const String splashScreen = '/splash_screen';

  static const String writeReviewScreen = '/write_review_screen';

  static const String chatDeletePage = '/chat_delete_page';

  static const String attachScreen = '/attach_screen';

  static const String videoCallScreen = '/video_call_screen';

  static const String notificationDeleteScreen = '/notification_delete_screen';

  static const String profileEditHouseOwnerScreen =
      '/profile_edit_house_owner_screen';

  static const String homeLocationScreen = '/home_location_screen';

  static const String scheduleDateScreen = '/schedule_date_screen';

  static const String scheduleVisitDetailsStudentScreen =
      '/schedule_visit_details_student_screen';

  static const String scheduleVisitConfirmedStudentScreen =
      '/schedule_visit_confirmed_student_screen';

  static const String scheduleVisitConfirmedOwnerScreen =
      '/schedule_visit_confirmed_owner_screen';

  static const String scheduleVisitCanceledStudentScreen =
      '/schedule_visit_canceled_student_screen';

  static const String scheduleVisitCanceledOwnerScreen =
      '/schedule_visit_canceled_owner_screen';

  static const String rescheduleVisitStudentScreen =
      '/reschedule_visit_student_screen';

  static const String rescheduleDateStudentScreen =
      '/reschedule_date_student_screen';

  static const String searchScreen = '/search_screen';

  static const String filterScreen = '/filter_screen';

  static const String reviewScreen = '/review_screen';

  static const String savedPage = '/saved_page';

  static const String chatScreen = '/chat_screen';

  static const String chatRoomScreen = '/chat_room_screen';

  static const String cameraScreen = '/camera_screen';

  static const String audioCallScreen = '/audio_call_screen';

  static const String notificationPage = '/notification_page';

  static const String profileStudentScreen = '/profile_student_screen';

  static const String twoFoctorAuthenticationStudentScreen =
      '/two_foctor_authentication_student_screen';

  static const String homeStudentScreen = '/home_student_screen';

  static const String homeAdminScreen = '/home_admin_screen';

  static const String detailsHouseScreen = '/details_house_screen';

  static const String adminRentalPropertyDetailsScreen = '/admin_rental_property_details_screen';

  static const String detailsHouseShareScreen = '/details_house_share_screen';

  static const String scheduleVisitScreen = '/schedule_visit_screen';

  static const String scheduledSuccessfullyScreen =
      '/scheduled_successfully_screen';

  static const String scheduledStatusPage = '/scheduled_status_page';

  static const String scheduledStatusContainerScreen =
      '/scheduled_status_container_screen';

  static const String loginStudentScreen = '/login_student_screen';

  static const String loginAdminScreen = '/login_admin_screen';

  static const String registerStudentScreen = '/register_student_screen';

  static const String registerAdminScreen = '/register_admin_screen';

  static const String otpVerificationStudentScreen =
      '/otp_verification_student_screen';

  static const String otpCodeStudentScreen = '/otp_code_student_screen';

  static const String studentVerificationSuccessScreen =
      '/student_verification_success_screen';

  static const String studentForgotPasswordScreen =
      '/student_forgot_password_screen';

  static const String studentEmailOtpCodeScreen =
      '/student_email_otp_code_screen';

  static const String newPasswordStudentScreen = '/new_password_student_screen';

  static const String studentPasswordChangesSuccessScreen =
      '/student_password_changes_success_screen';

  static const String welcomeUserScreen = '/welcome_user_screen';

  static const String loginHouseOwnerScreen = '/login_house_owner_screen';

  static const String registerHouseOwnerScreen = '/register_house_owner_screen';

  static const String otpVerificationScreen = '/otp_verification_screen';

  static const String otpCodeScreen = '/otp_code_screen';

  static const String verificationSuccessScreen =
      '/verification_success_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String emailOtpCodeScreen = '/email_otp_code_screen';

  static const String newPasswordHouseOwnerScreen =
      '/new_password_house_owner_screen';

  static const String passwordChangesSuccessScreen =
      '/password_changes_success_screen';

  static const String faceVerificationScreen = '/face_verification_screen';

  static const String frontIcCardScreen = '/front_ic_card_screen';

  static const String takeASelfieScreen = '/take_a_selfie_screen';

  static const String faceOvalScreen = '/face_oval_screen';

  static const String corectFaceOneScreen = '/corect_face_one_screen';

  static const String icVerifyingScreen = '/ic_verifying_screen';

  static const String filterScreenOwnerScreen = '/filter_screen_owner_screen';

  static const String veryingOwnerScreen = '/verying_owner_screen';

  static const String addedPropertySuccessfullyScreen =
      '/added_property_successfully_screen';

  static const String reviewScreenOwnerScreen = '/review_screen_owner_screen';

  static const String updatePropertySuccessfullyScreen =
      '/update_property_successfully_screen';

  static const String scheduledRequestedScreen = '/scheduled_requested_screen';

  static const String rescheduleDateScreen = '/reschedule_date_screen';

  static const String chatDeleteOwnerScreen = '/chat_delete_owner_screen';

  static const String attachOwnerScreen = '/attach_owner_screen';

  static const String videoCallOwnerScreen = '/video_call_owner_screen';

  static const String notificationOwnerScreen = '/notification_owner_screen';

  static const String profileHouseOwnerScreen = '/profile_house_owner_screen';

  static const String profileAdminScreen = '/profile_admin_screen';

  static const String profileEditOwnerScreen = '/profile_edit_owner_screen';

  static const String profileEditAdminScreen = '/profile_edit_admin_screen';

  static const String icVerificationScreen = '/ic_verification_screen';

  static const String backIcCardScreen = '/back_ic_card_screen';

  static const String startRecordScreen = '/start_record_screen';

  static const String corectFaceScreen = '/corect_face_screen';

  static const String corectFaceTwoScreen = '/corect_face_two_screen';

  static const String scheduleVisitDetailsScreen =
      '/schedule_visit_details_screen';

  static const String confirmedScheduledSuccessfullyScreen =
      '/confirmed_scheduled_successfully_screen';

  static const String chatOwnerScreen = '/chat_owner_screen';

  static const String chatRoomOwnerScreen = '/chat_room_owner_screen';

  static const String cameraOwnerScreen = '/camera_owner_screen';

  static const String audioCallOwnerScreen = '/audio_call_owner_screen';

  static const String notificationDeleteOwnerScreen =
      '/notification_delete_owner_screen';

  static const String faceIdOwnerScreen = '/face_id_owner_screen';

  static const String twoFoctorAuthenticationHouseOwnerScreen =
      '/two_foctor_authentication_house_owner_screen';

  static const String homeHouseOwnerScreen = '/home_house_owner_screen';

  static const String archiveHomeHouseOwnerScreen =
      '/archive_home_house_owner_screen';

  static const String searchScreenOwnerScreen = '/search_screen_owner_screen';

  static const String addHouseRentalScreen = '/add_house_rental_screen';

  static const String detailsHouseRentalScreen = '/details_house_rental_screen';

  static const String updateHouseRentalScreen = '/update_house_rental_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    writeReviewScreen: (context) => WriteReviewScreen(),
    attachScreen: (context) => AttachScreen(),
    videoCallScreen: (context) => VideoCallScreen(),
    notificationDeleteScreen: (context) => NotificationDeleteScreen(),
    profileEditHouseOwnerScreen: (context) => ProfileEditHouseOwnerScreen(),
    homeLocationScreen: (context) => HomeLocationScreen(),
    scheduleDateScreen: (context) => ScheduleDateScreen(),
    scheduleVisitDetailsStudentScreen: (context) =>
        ScheduleVisitDetailsStudentScreen(),
    scheduleVisitConfirmedStudentScreen: (context) =>
        ScheduleVisitConfirmedStudentScreen(),
    scheduleVisitConfirmedOwnerScreen: (context) =>
        ScheduleVisitConfirmedOwnerScreen(),
    scheduleVisitCanceledStudentScreen: (context) =>
        ScheduleVisitCanceledStudentScreen(),
    scheduleVisitCanceledOwnerScreen: (context) =>
        ScheduleVisitCanceledOwnerScreen(),
    rescheduleVisitStudentScreen: (context) => RescheduleVisitStudentScreen(),
    rescheduleDateStudentScreen: (context) => RescheduleDateStudentScreen(),
    searchScreen: (context) => SearchScreen(),
    filterScreen: (context) => FilterScreen(),
    reviewScreen: (context) => ReviewScreen(),
    chatScreen: (context) => ChatScreen(),
    chatRoomScreen: (context) => ChatRoomScreen(),
    cameraScreen: (context) => CameraScreen(),
    audioCallScreen: (context) => AudioCallScreen(),
    profileStudentScreen: (context) => ProfileStudentScreen(),
    profileAdminScreen: (context) => ProfileAdminScreen(),
    twoFoctorAuthenticationStudentScreen: (context) =>
        TwoFoctorAuthenticationStudentScreen(),
    homeStudentScreen: (context) => HomeStudentScreen(),
    detailsHouseScreen: (context) => DetailsHouseScreen(),
    adminRentalPropertyDetailsScreen: (context) => AdminRentalPropertyDetailsScreen(),
    detailsHouseShareScreen: (context) => DetailsHouseShareScreen(),
    scheduleVisitScreen: (context) => ScheduleVisitScreen(),
    scheduledSuccessfullyScreen: (context) => ScheduledSuccessfullyScreen(),
    scheduledStatusContainerScreen: (context) =>
        ScheduledStatusContainerScreen(),
    loginStudentScreen: (context) => LoginStudentScreen(),
    loginAdminScreen: (context) => LoginAdminScreen(),
    registerStudentScreen: (context) => RegisterStudentScreen(),
    registerAdminScreen: (context) => RegisterAdminScreen(),
    otpVerificationStudentScreen: (context) => OtpVerificationStudentScreen(),
    otpCodeStudentScreen: (context) => OtpCodeStudentScreen(),
    studentVerificationSuccessScreen: (context) =>
        StudentVerificationSuccessScreen(),
    studentForgotPasswordScreen: (context) => StudentForgotPasswordScreen(),
    studentEmailOtpCodeScreen: (context) => StudentEmailOtpCodeScreen(),
    newPasswordStudentScreen: (context) => NewPasswordStudentScreen(),
    studentPasswordChangesSuccessScreen: (context) =>
        StudentPasswordChangesSuccessScreen(),
    welcomeUserScreen: (context) => WelcomeUserScreen(),
    loginHouseOwnerScreen: (context) => LoginHouseOwnerScreen(),
    registerHouseOwnerScreen: (context) => RegisterHouseOwnerScreen(),
    otpVerificationScreen: (context) => OtpVerificationScreen(),
    otpCodeScreen: (context) => OtpCodeScreen(),
    verificationSuccessScreen: (context) => VerificationSuccessScreen(),
    forgotPasswordScreen: (context) => ForgotPasswordScreen(),
    emailOtpCodeScreen: (context) => EmailOtpCodeScreen(),
    newPasswordHouseOwnerScreen: (context) => NewPasswordHouseOwnerScreen(),
    passwordChangesSuccessScreen: (context) => PasswordChangesSuccessScreen(),
    faceVerificationScreen: (context) => FaceVerificationScreen(),
    frontIcCardScreen: (context) => FrontIcCardScreen(),
    takeASelfieScreen: (context) => TakeASelfieScreen(),
    faceOvalScreen: (context) => FaceOvalScreen(),
    corectFaceOneScreen: (context) => CorectFaceOneScreen(),
    icVerifyingScreen: (context) => IcVerifyingScreen(),
    filterScreenOwnerScreen: (context) => FilterScreenOwnerScreen(),
    veryingOwnerScreen: (context) => VeryingOwnerScreen(),
    addedPropertySuccessfullyScreen: (context) =>
        AddedPropertySuccessfullyScreen(),
    reviewScreenOwnerScreen: (context) => ReviewScreenOwnerScreen(),
    updatePropertySuccessfullyScreen: (context) =>
        UpdatePropertySuccessfullyScreen(),
    scheduledRequestedScreen: (context) => ScheduledRequestedScreen(),
    rescheduleDateScreen: (context) => RescheduleDateScreen(),
    chatDeleteOwnerScreen: (context) => ChatDeleteOwnerScreen(),
    attachOwnerScreen: (context) => AttachOwnerScreen(),
    videoCallOwnerScreen: (context) => VideoCallOwnerScreen(),
    notificationOwnerScreen: (context) => NotificationOwnerScreen(),
    profileHouseOwnerScreen: (context) => ProfileHouseOwnerScreen(),
    profileEditOwnerScreen: (context) => ProfileEditOwnerScreen(),
    profileEditAdminScreen: (context) => ProfileEditAdminScreen(),
    icVerificationScreen: (context) => IcVerificationScreen(),
    backIcCardScreen: (context) => BackIcCardScreen(),
    startRecordScreen: (context) => StartRecordScreen(),
    corectFaceScreen: (context) => CorectFaceScreen(),
    savedPage: (context) => SavedPage(),
    scheduledStatusPage: (context) => ScheduledStatusPage(),
    corectFaceTwoScreen: (context) => CorectFaceTwoScreen(),
    scheduleVisitDetailsScreen: (context) => ScheduleVisitDetailsScreen(),
    confirmedScheduledSuccessfullyScreen: (context) =>
        ConfirmedScheduledSuccessfullyScreen(),
    chatOwnerScreen: (context) => ChatOwnerScreen(),
    chatRoomOwnerScreen: (context) => ChatRoomOwnerScreen(),
    cameraOwnerScreen: (context) => CameraOwnerScreen(),
    audioCallOwnerScreen: (context) => AudioCallOwnerScreen(),
    notificationDeleteOwnerScreen: (context) => NotificationDeleteOwnerScreen(),
    faceIdOwnerScreen: (context) => FaceIdOwnerScreen(),
    twoFoctorAuthenticationHouseOwnerScreen: (context) =>
        TwoFoctorAuthenticationHouseOwnerScreen(),
    homeHouseOwnerScreen: (context) => HomeHouseOwnerScreen(),
    homeAdminScreen: (context) => HomeAdminScreen(),
    archiveHomeHouseOwnerScreen: (context) => ArchiveHomeHouseOwnerScreen(),
    searchScreenOwnerScreen: (context) => SearchScreenOwnerScreen(),
    addHouseRentalScreen: (context) => AddHouseRentalScreen(),
    detailsHouseRentalScreen: (context) => DetailsHouseRentalScreen(),
    updateHouseRentalScreen: (context) => UpdateHouseRentalScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
