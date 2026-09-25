import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/custom_text.dart';
import '../utils/custom_button.dart';
import '../utils/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: 'Sign Up',
                      size: 32,
                      weight: FontWeight.bold,
                    ),
                    const SizedBox(height: 5),
                    const CustomText(
                      text: 'Create a new account to get started',
                      size: 12,
                    ),
                    const SizedBox(height: 25),
                    const CustomTextField(
                      hintText: 'Email',
                      icon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 15),
                    const CustomTextField(
                      hintText: 'User Name',
                      icon: Icons.person_outline,
                    ),
                    const SizedBox(height: 15),
                    const CustomTextField(
                      hintText: 'Password',
                      icon: Icons.visibility_off,
                      isPassword: true,
                    ),
                    const SizedBox(height: 25),
                    CustomButton(text: 'Sign Up', onPressed: () {}),
                    const SizedBox(height: 15),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const CustomText(
                          text: "Already have an account? Login",
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
