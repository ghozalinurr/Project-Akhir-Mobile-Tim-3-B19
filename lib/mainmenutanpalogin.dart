import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pamob/alert.dart';
import 'package:pamob/formlogin.dart';
import 'package:pamob/itemmain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePagenolog(),
    );
  }
}

class MyHomePagenolog extends StatelessWidget {
  const MyHomePagenolog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF009393),
        title: Text(
          "Tips App",
          style: TextStyle(
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      body: SecondPage(),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF016170),
              ),
              child: Text(
                "Tips App",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text(
                "Kelola Tips",
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                ),
              ),
              tileColor: Color(0xFF009393),
              onTap: () {
                CustomAlert(context, "Login Terlebih Dahulu!");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final List<BottomNavigationBarItem> _myItem = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        color: Color(0xFF016170),
      ),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite,
        color: Color(0xFF016170),
      ),
      label: "Favorite",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.person,
        color: Color(0xFF016170),
      ),
      label: "Profil",
    ),
  ];

  final List<Widget> _myPages = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
        ),
        Text(
          "Tips\n",
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
        Container(
          child: Image.asset(
            "assets/lampu.png",
            width: 400,
            height: 400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Text(
            "\nTips App merupakan tempat tips-tips untuk pengoptimalan penggunaan Smartphone",
            style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 40),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF009393),
              minimumSize: Size(180, 50),
            ),
            onPressed: () {
              Get.to(readData());
            },
            child: Text(
              "Lihat Tips",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
        ),
        Text(
          "Favorit Anda\n",
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
        Container(
          child: Image.asset(
            "assets/favorit.png",
            width: 400,
            height: 400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Text(
            "\nTips Favorit merupakan tempat tips-tips favorit yang ditambahkan oleh pengguna",
            style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)),
          ),
        ),
        Text(
          "Login Terlebih Dahulu!",
          style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)),
        ),
        Container(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF016170),
              //minimumSize: Size(180, 50),
            ),
            onPressed: () {
              Get.to(loginHome());
            },
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
        ),
        Text(
          "Tentang Anda\n",
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
        Container(
          child: Image.asset(
            "assets/profil.png",
            width: 400,
            height: 400,
          ),
        ),
        Text(
          "Login Terlebih Dahulu!",
          style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)),
        ),
        Container(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF016170),
              //minimumSize: Size(180, 50),
            ),
            onPressed: () {
              Get.to(loginHome());
            },
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ],
    ),
  ];

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF016170),
      body: SingleChildScrollView(
        child: _myPages.elementAt(_pageIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        items: _myItem,
        onTap: (int newIndex) {
          setState(() {
            _pageIndex = newIndex;
          });
        },
      ),
    );
  }
}

class readData extends StatelessWidget {
  const readData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference tips = firestore.collection("tips");
    return Container(
      child: Scaffold(
        backgroundColor: Color(0xFF016170),
        appBar: AppBar(
          backgroundColor: Color(0xFF009393),
          title: Text(
            'Tips',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Stack(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: tips.snapshots(),
              builder: (_, snapshot) {
                return (snapshot.hasData)
                    ? Column(
                        children: snapshot.data!.docs
                            .map(
                              (e) => ItemCardmenu(
                                e.get('judul'),
                                e.get('isi'),
                                onUpdate: () {
                                  tips.doc(e.id).update(
                                    {'tingkat': e.get('tingkat') + 2},
                                  );
                                },
                              ),
                            )
                            .toList(),
                      )
                    : Text(
                        "Loading...",
                        style: TextStyle(color: Colors.white),
                      );
              },
            ),
            SizedBox(height: 350)
          ],
        ),
      ),
    );
  }
}
