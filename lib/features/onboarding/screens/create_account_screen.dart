import 'package:demo_app/utils/colors.dart';
import 'package:demo_app/utils/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                "Create Account",
                style: context.textTheme.titleSmall,
              ),
              const SizedBox(height: 4),
              Text(
                "Start shopping with create your account",
                style:
                    context.textTheme.displaySmall?.copyWith(color: AppColors.grayA7AEC0),
              ),
              const SizedBox(height: 30),
              AppTextField(onChanged: (val) {}, label: "Email"),
              const SizedBox(height: 20),
              AppTextField(onChanged: (val) {}, label: "Password")
            ],
          ),
        ),
      ),
    );
  }
}
