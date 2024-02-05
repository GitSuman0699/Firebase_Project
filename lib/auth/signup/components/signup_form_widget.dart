import 'package:firebase_project/auth/signup/signup_controller.dart';
import 'package:firebase_project/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpFormWidget extends ConsumerStatefulWidget {
  const SignUpFormWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends ConsumerState<SignUpFormWidget> {
  // late final User currentUser

  final fullName = TextEditingController();
  final email = TextEditingController();
  final mobile = TextEditingController();
  final password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppDeviceUtils.getScreenWidth(context) - 350),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              style: const TextStyle(color: Colors.black),
              controller: fullName,
              decoration: const InputDecoration(
                label: Text(
                  "Full Name",
                  style: TextStyle(color: Colors.black),
                ),
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              style: const TextStyle(color: Colors.black),
              controller: email,
              decoration: const InputDecoration(
                label: Text(
                  "Email",
                  style: TextStyle(color: Colors.black),
                ),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              style: const TextStyle(color: Colors.black),
              controller: mobile,
              decoration: const InputDecoration(
                label: Text(
                  "Mobile",
                  style: TextStyle(color: Colors.black),
                ),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              style: const TextStyle(color: Colors.black),
              controller: password,
              decoration: const InputDecoration(
                label: Text(
                  "Password",
                  style: TextStyle(color: Colors.black),
                ),
                prefixIcon: Icon(Icons.password_outlined),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: AppDeviceUtils.getScreenWidth(context),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Map<String, dynamic> userData = {
                      'email': email.text.trim(),
                      'password': password.text.trim(),
                    };
                    ref
                        .read(resigterUser(userData).future)
                        .then((value) => null);
                  } else {}
                },
                child: const Text("SIGNUP"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
