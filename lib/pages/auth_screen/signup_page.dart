import "package:flutter/material.dart";
import "package:namma_ui_kit/pages/auth_screen/signin_page.dart";

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Sign up", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Create your own Account",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            const Text(
              "Sign up with your email",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),

            //First Name
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                color: Colors.grey[900], // Dark background color
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              child: TextFormField(
                style: const TextStyle(color: Colors.white), // Text color
                decoration: const InputDecoration(
                  hintText: 'First Name',
                  hintStyle:
                      TextStyle(color: Colors.white60), // Hint text color
                  border: InputBorder.none, // Remove default border
                ),
                cursorColor: Colors.white, // Cursor color
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //Last Name
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                color: Colors.grey[900], // Dark background color
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              child: TextFormField(
                style: const TextStyle(color: Colors.white), // Text color
                decoration: const InputDecoration(
                  hintText: 'Last Name',
                  hintStyle:
                      TextStyle(color: Colors.white60), // Hint text color
                  border: InputBorder.none, // Remove default border
                ),
                cursorColor: Colors.white, // Cursor color
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //Email
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                color: Colors.grey[900], // Dark background color
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              child: TextFormField(
                style: const TextStyle(color: Colors.white), // Text color
                decoration: const InputDecoration(
                  hintText: 'Email',
                  hintStyle:
                      TextStyle(color: Colors.white60), // Hint text color
                  border: InputBorder.none, // Remove default border
                ),
                cursorColor: Colors.white, // Cursor color
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //Password
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                color: Colors.grey[900], // Dark background color
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              child: TextFormField(
                style: const TextStyle(color: Colors.white), // Text color
                decoration: const InputDecoration(
                  hintText: 'Password',
                  hintStyle:
                      TextStyle(color: Colors.white60), // Hint text color
                  border: InputBorder.none, // Remove default border
                ),
                cursorColor: Colors.white, // Cursor color
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
                onPressed: () {},
                child: const Text("Sign up",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold))),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? ",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SigninPage()));
                    },
                    child: const Text("Sign in",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                        )))
              ],
            )
          ],
        ),
      ),
    );
  }
}
