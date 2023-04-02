import 'package:banking_project/handlers/authhandler.dart';
import 'package:banking_project/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStateProvider = StateProvider<bool>((ref) {
  return false;
});

class LoginScreen extends ConsumerStatefulWidget {
  final bool isNew;
  const LoginScreen({super.key, this.isNew = false});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(counterStateProvider.notifier).state = widget.isNew;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool provider = ref.watch(counterStateProvider);
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/homepage_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width > 480 ? 120 : 40,
                    0,
                    0,
                    0),
                child: SizedBox(
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        provider ? "Register" : "Login",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: emailControler,
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            hintText: 'Enter Your Email',
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.blue),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.green,
                            ),
                            hintStyle: TextStyle(color: Colors.white60),
                            errorStyle: TextStyle(color: Colors.red)),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: passwordControler,
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            hintText: 'Enter Your Password',
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.blue),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.green,
                            ),
                            hintStyle: TextStyle(color: Colors.white60),
                            errorStyle: TextStyle(color: Colors.red)),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            bool status = provider
                                ? await AuthServices()
                                    .registerUserWithEmailAndPassword(
                                        emailControler.text,
                                        passwordControler.text)
                                : await AuthServices()
                                    .loginUserWithEmailAndPassword(
                                        emailControler.text,
                                        passwordControler.text);

                            if (status) {
                              if (!mounted) return;
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(provider ? "Register" : "Login"),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          ref.read(counterStateProvider.notifier).state =
                              !ref.read(counterStateProvider);
                        },
                        child: Text(
                          provider
                              ? "Already have an account? Login insted!"
                              : "New User? Register!",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
