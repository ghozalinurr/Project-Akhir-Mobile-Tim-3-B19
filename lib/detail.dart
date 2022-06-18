import 'package:flutter/material.dart';

class tesview extends StatefulWidget {
  final String judul, isi;
  const tesview({Key? key, required this.judul, required this.isi})
      : super(key: key);

  @override
  State<tesview> createState() => _tesviewState();
}

class _tesviewState extends State<tesview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF016170),
      appBar: AppBar(
        title: Text("Details"),
        backgroundColor: Color(0xFF009393),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 15)),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "${widget.judul}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color(0xFF009393),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "\n${widget.isi}",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
