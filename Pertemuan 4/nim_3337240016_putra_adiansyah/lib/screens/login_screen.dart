import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/custom_text.dart';
import '../utils/custom_button.dart';
import '../utils/custom_text_field.dart';
import 'signup_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                      text: 'Login',
                      size: 32,
                      weight: FontWeight.bold,
                    ),
                    const SizedBox(height: 5),
                    const CustomText(
                      text: 'Welcome back please login to your account',
                      size: 12,
                    ),
                    const SizedBox(height: 25),
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
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: Colors.greenAccent,
                          size: 18,
                        ),
                        const SizedBox(width: 5),
                        const CustomText(text: 'Remember me', size: 12),
                      ],
                    ),
                    const SizedBox(height: 25),
                    CustomButton(text: 'Login', onPressed: () {}),
                    const SizedBox(height: 15),

                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
                            ),
                          );
                        },
                        child: const CustomText(
                          text: "Don't have an account? Signup",
                          size: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordScreen(),
                            ),
                          );
                        },
                        child: const CustomText(
                          text: "Forgot Password?",
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
