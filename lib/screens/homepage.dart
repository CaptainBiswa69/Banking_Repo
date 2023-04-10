import 'package:banking_project/screens/card_view.dart';
import 'package:banking_project/screens/login.dart';
import 'package:banking_project/screens/transaction.dart';
import 'package:banking_project/screens/transactions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String? name;
  String? phoneNumber;
  String? accountNumber;

  getData() async {
    await FirebaseFirestore.instance
        .collection("UserData")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) {
      name = value.data()?["Name"];
      phoneNumber = value.data()?["Account Number"];
      accountNumber = value.data()?["Phone Number"];
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddTransaction()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(auth.currentUser?.displayName ?? "Biswa"),
              accountEmail:
                  Text(auth.currentUser?.email ?? "ashishrawat2911@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: const Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.train,
              ),
              title: const Text('Transcations'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Transactionscreen()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.card_giftcard,
              ),
              title: const Text('Cards'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CardView()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
              ),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: ProfilePicture(
                  name: "Guest",
                  radius: 60,
                  fontsize: 30,
                  random: true,
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(accountNumber ?? "1234567"),
                    subtitle: const Text('Account No'),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.insert_drive_file),
                    title: Text(FirebaseAuth.instance.currentUser?.uid ?? ""),
                    subtitle: const Text("UserId"),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(
                        FirebaseAuth.instance.currentUser?.displayName ??
                            "Biswajeet"),
                    subtitle: const Text("Name"),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: const Icon(Icons.call),
                    title: Text(phoneNumber ?? "+917008724191"),
                    subtitle: const Text("Phone Number"),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(Icons.call),
                    title: Text('Burla'),
                    subtitle: Text("Branch"),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(Icons.call),
                    title: Text('SBI00N01540'),
                    subtitle: Text("IFSC Code"),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(Icons.call),
                    title: Text('Jyoti Kunda'),
                    subtitle: Text("Nominee Name"),
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
