import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:demo_app/features/onboarding/controllers/start_screen_controller.dart';
import 'package:demo_app/features/onboarding/data/models/start_page.dart';
import 'package:demo_app/utils/colors.dart';
import 'package:demo_app/utils/shared/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartScreen extends StatelessWidget {
  StartScreen({super.key});

  final StartScreenController _controller = Get.put(StartScreenController());

  final pageIndex = RxInt(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.colors.scheme.background,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Expanded(
                child: PageView.builder(
                    itemCount: _controller.startData.length,
                    onPageChanged: pageIndex,
                    itemBuilder: (context, index) =>
                        _pageViewItem(_controller.startData[index], context)),
              ),
              _indicatorWidget(),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: AppButton(
                    title: "Create Account", onPressed: _controller.onCreateAccount),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: AppButton(
                    title: "Already Have an Account",
                    type: AppButtonType.transparent,
                    onPressed: () {}),
              ),
            ],
          ),
        ));
  }

  Widget _indicatorWidget() {
    return Container(
      alignment: Alignment.center,
      height: 10,
      width: 50,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Obx(() {
              final isActive = index == pageIndex.value;
              return Container(
                height: 10,
                width: 10,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primaryColor.withOpacity(isActive ? 1 : 0.2)),
              );
            });
          }),
    );
  }

  Widget _pageViewItem(StartPageData item, BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Flexible(
              flex: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  item.image,
                  height: Get.height * 0.45,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  item.title,
                  style: context.textTheme.titleLarge,
                  textAlign: TextAlign.center,
                )),
            const SizedBox(height: 25),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  item.description,
                  style: context.textTheme.displaySmall
                      ?.copyWith(color: AppColors.grayA7AEC0),
                  textAlign: TextAlign.center,
                )),
          ],
        ));
  }
}
