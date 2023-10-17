// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/main_pages.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  var emailController = TextEditingController(text: "");
  var senhaController = TextEditingController(text: "");
  // String email = "";
  // String senha = "";
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        body: SingleChildScrollView(
          // width: double.infinity,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Expanded(
                      flex: 8,
                      child: Image.network(
                        "https://hermes.digitalinnovation.one/assets/diome/logo.png",
                        // height: 125,
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Já tem cadastro? ",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Faça seu login e make the change_",
                  style: TextStyle(fontSize: 19, color: Colors.white),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  // color: const Color.fromARGB(255, 255, 255, 255),
                  height: 30,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: emailController,
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: 0),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color.fromARGB(255, 192, 94, 159),
                        )),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 192, 94, 159),
                          ),
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 192, 94, 159),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  // color: const Color.fromARGB(255, 76, 130, 175),
                  height: 30,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: senhaController,
                    obscureText: isObscureText,
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 0),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Color.fromARGB(255, 192, 94, 159),
                      )),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 192, 94, 159),
                        ),
                      ),
                      hintText: "Senha",
                      hintStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color.fromARGB(255, 192, 94, 159),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isObscureText = !isObscureText;
                          });
                        },
                        child: Icon(
                          isObscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: const Color.fromARGB(255, 192, 94, 159),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // Expanded(child: Container()),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  // color: Colors.green,
                  // height: 50,
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {
                          if (emailController.text == "email@gmail.com" &&
                              senhaController.text == "123") {
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(
                            //       content: Text("Login efetuado com sucesso")),
                            // );
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainPage()));
                            debugPrint("login efetuado com susseso");
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("erro aou efetuar o login")),
                            );
                            debugPrint("erro aou efetuar o login");
                          }
                          debugPrint(emailController.text);
                          debugPrint(senhaController.text);
                        },
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            backgroundColor: const MaterialStatePropertyAll(
                                Color.fromARGB(255, 192, 94, 159))),
                        child: const Text(
                          "ENTRAR",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        )),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  // width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  // color: Colors.green,
                  height: 30,
                  alignment: Alignment.center,
                  child: const Text(
                    "Esqueci minha senha",
                    style: TextStyle(
                        color: Color.fromRGBO(209, 158, 6, 1),
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  // color: Colors.green,
                  height: 30,
                  alignment: Alignment.center,
                  child: const Text(
                    "Criar conta",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w300),
                  ),
                ),
                const SizedBox(
                  height: 50,
                )
                // Expanded(child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
