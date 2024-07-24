import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/auth_controller.dart';
import 'package:meals/screens/signup.dart';
import 'package:meals/screens/tabs.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUser() async {
    final auth = ref.read(authProvider.notifier);
    var res = await auth.loginUser(
        email: emailController.text, password: passwordController.text);
    if (res != 'login successful') {
      // print(res);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res)));
      return;
    }
    // var  userName = await _firestore.collection('user').doc(res[1]);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const TabsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Heading
                const Text(
                  'Welcome back!',
                  style: TextStyle(fontSize: 40),
                ),

                // Sub-Heading
                const Text('Login to your account',
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 40),

                // Username Text-box
                const Text('Username / Email', style: TextStyle(fontSize: 20)),
                const SizedBox(height: 4),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Icon(Icons.person),
                    ),
                    hintText: 'Username / Email',
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(63, 0, 0, 0), width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(63, 0, 0, 0), width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // Password text-box
                const Text('Password', style: TextStyle(fontSize: 20)),
                const SizedBox(height: 4),
                TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Icon(Icons.lock_open_sharp),
                    ),
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(63, 0, 0, 0), width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Color.fromARGB(63, 0, 0, 0), width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: InkWell(
                    onTap: loginUser,
                    focusColor: Theme.of(context).colorScheme.primary,
                    highlightColor: Theme.of(context).colorScheme.primary,
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                              child:
                                  Text('Login', style: TextStyle(fontSize: 22)),
                            ),
                          ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            padding: EdgeInsets.all(0),
                            shadowColor: Colors.transparent),
                        child: const Text(
                          'Signup',
                        ),
                      )
                    ],
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
