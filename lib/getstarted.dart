import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pamob/formlogin.dart';
import 'package:pamob/mainmenutanpalogin.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF016170),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: lebar,
                height: 50,
                //margin: EdgeInsets.only(top: 40),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF009393),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "SELAMAT DATANG",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  " Tim 3",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              Text(
                "\nTips App\n",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              Container(
                width: 250,
                height: 200,
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/logomob.png"),
                  ),
                ),
              ),
              Text(
                "\n\n\n\nTips App merupakan tempat berbagai tips yang akan membantu pengguna\n\n\n",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFFFFFFFF),
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
                    Get.to(MyHomePagenolog());
                  },
                  child: Text(
                    "Mulai",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
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
          )
        ],
      ),
    );
  }
}
