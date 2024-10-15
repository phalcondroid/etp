import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Expanded(
                  flex: 20,
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(child: Text("2")),
                  ),
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
                const Expanded(
                  flex: 15,
                  child: SizedBox(
                      width: double.infinity,
                      child: Center(
                          child: TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.person), hintText: "Usuario"),
                      ))),
                ),
                const Expanded(
                  flex: 15,
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                        child: TextField(
                      decoration: InputDecoration(
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
                            onPressed: () => print("click"),
                            child: Row(
                              children: [
                                Expanded(child: Icon(Icons.play_arrow)),
                                Expanded(
                                    flex: 3,
                                    child: Center(
                                      child: Text(
                                        "Iniciar Sesión",
                                        textAlign: TextAlign.justify,
                                      ),
                                    )),
                                Spacer(),
                              ],
                            ))),
                  ),
                ),
                Expanded(
                  flex: 50,
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(child: Text("6")),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
