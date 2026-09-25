import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/custom_text.dart';
import '../utils/custom_button.dart';
import '../utils/custom_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?q=80&w=1000&auto=format&fit=crop',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: 320,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2), // Efek kaca
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: 'Reset Password',
                      size: 28,
                      weight: FontWeight.bold,
                    ),
                    const SizedBox(height: 5),
                    const CustomText(
                      text: 'Enter your email to receive a reset link',
                      size: 12,
                    ),
                    const SizedBox(height: 25),
                    const CustomTextField(
                      hintText: 'Email Address',
                      icon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 25),
                    CustomButton(text: 'Send Link', onPressed: () {}),
                    const SizedBox(height: 15),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const CustomText(
                          text: "Back to Login",
                          size: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Center(
                      child: CustomText(
                        text: 'Created by putra_adiansyah',
                        size: 10,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
