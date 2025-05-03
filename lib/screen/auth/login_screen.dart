import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/common.dart';
import 'package:story_app/provider/auth/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  final Function() onLogin;
  final Function() onRegister;

  const LoginScreen({
    super.key,
    required this.onLogin,
    required this.onRegister,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<AuthProvider>().isLoadingLogin;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock_outline, size: 80, color: Colors.blueAccent),
                const SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context)!.loginTitle,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context)!.loginSubtitle,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 32),

                // Email
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.emailField,
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.emailEmptyError;
                    }
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (!emailRegex.hasMatch(value)) {
                      return AppLocalizations.of(context)!.emailInvalidError;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Password
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.passwordField,
                    prefixIcon: const Icon(Icons.lock_outline),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.passwordEmptyError;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Login Button
                isLoading
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              final result = await context.read<AuthProvider>().login(
                                    emailController.text,
                                    passwordController.text,
                                  );
                              if (result == true) {
                                widget.onLogin();
                              } else if (result is String) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(result)),
                                );
                              }
                            }
                          },
                          child: Text(AppLocalizations.of(context)!.loginButton, style: TextStyle(fontSize: 16)),
                        ),
                      ),
                const SizedBox(height: 16),

                // Register Link
                TextButton(
                  onPressed: () => widget.onRegister(),
                  child: Text(
                    AppLocalizations.of(context)!.toRegisterText,
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
