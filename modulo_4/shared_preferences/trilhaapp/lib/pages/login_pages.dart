// import 'dart:html';

import 'package:flutter/material.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Icon(
                Icons.person,
                size: 150,
                color: Colors.blue,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                color: const Color.fromARGB(255, 255, 255, 255),
                height: 50,
                alignment: Alignment.center,
                child: const Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(flex: 2, child: Text("informe seu Email:")),
                    // SizedBox(
                    //   width: 20,
                    // ),
                    Expanded(flex: 3, child: Text("Email")),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                // color: const Color.fromARGB(255, 76, 130, 175),
                height: 50,
                alignment: Alignment.center,
                child: const Row(
                  children: [
                    Expanded(flex: 2, child: Text("informe a senha:")),
                    // SizedBox(
                    //   width: 20,
                    // ),
                    Expanded(flex: 3, child: Text("Senha")),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(child: Container()),
              Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                color: Colors.green,
                height: 50,
                alignment: Alignment.center,
                child: const Text("Login"),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                // width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                // color: Colors.green,
                height: 50,
                alignment: Alignment.center,
                child: const Text("cadastro"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
