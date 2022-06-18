import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pamob/detail.dart';

class ItemCardmenu extends StatelessWidget {
  final String judul, isi;

  //// Pointer to Update Function
  final Function? onUpdate;
  //// Pointer to Delete Function
  final Function? onDelete;

  ItemCardmenu(this.judul, this.isi, {this.onUpdate, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color(0xFF009393),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xFFffffff),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  judul,
                  style: TextStyle(
                    color: Color(0xFFfffffff),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.blue,
                    ),
                    child: Center(
                        child: Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: Colors.white,
                    )),
                    onPressed: () {
                      Get.to(tesview(judul: judul, isi: isi));
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
