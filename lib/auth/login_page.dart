import 'package:etp/welcome/welcome_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userCtrl = TextEditingController();
    TextEditingController passCtrl = TextEditingController();
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 0.93,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Spacer(
                    flex: 20,
                  ),
                  Expanded(
                    flex: 40,
                    child: SizedBox(
                      width: double.infinity,
                      child: Center(
                          child: Image.asset("assets/images/ambulance.png")),
                    ),
                  ),
                  const Expanded(
                    flex: 10,
                    child: SizedBox(
                      width: double.infinity,
                      child: Center(
                          child: Text(
                        "Emergency Transport Priority",
                        style: TextStyle(fontSize: 20),
                      )),
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: SizedBox(
                        width: double.infinity,
                        child: Center(
                            child: TextField(
                          controller: userCtrl,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.person), hintText: "Usuario"),
                        ))),
                  ),
                  Expanded(
                    flex: 15,
                    child: SizedBox(
                      width: double.infinity,
                      child: Center(
                          child: TextField(
                        controller: passCtrl,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          hintText: "Contraseña",
                        ),
                        obscureText: true,
                      )),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.60,
                      child: Center(
                          child: ElevatedButton(
                              onPressed: () {
                                const String user = "luisa";
                                const String pass = "123";
                                if (user == userCtrl.text &&
                                    pass == passCtrl.text) {
                                  Navigator.pushAndRemoveUntil<WelcomePage>(
                                    context,
                                    MaterialPageRoute<WelcomePage>(
                                      builder: (_) => const WelcomePage(),
                                    ),
                                    (Route<dynamic> route) => false,
                                  );
                                  return;
                                }
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: const Text(
                                              'Password y Usuario invalidos!'),
                                          content: const Text(
                                              'AlertDialog description'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  context, 'Cancel'),
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, 'OK'),
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        ));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(88, 147, 138, 1),
                              ),
                              child: const Row(
                                children: [
                                  Expanded(
                                      child: Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                  )),
                                  Expanded(
                                      flex: 3,
                                      child: Center(
                                        child: Text(
                                          "Iniciar Sesión",
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )),
                                  Spacer(),
                                ],
                              ))),
                    ),
                  ),
                  const Spacer(flex: 50)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
