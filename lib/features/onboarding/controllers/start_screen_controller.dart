import 'package:demo_app/features/onboarding/data/models/start_page.dart';
import 'package:demo_app/features/onboarding/data/onboarding_defination.dart';
import 'package:demo_app/features/onboarding/screens/create_account_screen.dart';
import 'package:get/get.dart';

class StartScreenController extends GetxController {
  List<StartPageData> startData = [];

  @override
  onInit() {
    initStepData();
    super.onInit();
  }

  void initStepData() {
    final data = startSteps.map((e) => StartPageData.fromJson(e)).toList();
    startData.assignAll(data);
  }

  void onCreateAccount() {
    Get.to(() => const CreateAccountScreen(), transition: Transition.rightToLeftWithFade);
  }
}
