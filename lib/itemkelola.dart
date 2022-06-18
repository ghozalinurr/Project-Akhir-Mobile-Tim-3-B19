import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String judul;
  final String isi;
  final int tingkat;
  //// Pointer to Update Function
  final Function? onUpdate;
  //// Pointer to Delete Function
  final Function? onDelete;

  ItemCard(this.judul, this.isi, this.tingkat, {this.onUpdate, this.onDelete});

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
              SizedBox(
                width: 200,
                child: Text(
                  "Tips: $isi",
                  style: TextStyle(
                    color: Color(0xFFffffff),
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
                      primary: Colors.red,
                    ),
                    child: Center(
                        child: Icon(
                      Icons.favorite,
                      size: 20,
                      color: Colors.white,
                    )),
                    onPressed: () {
                      if (onUpdate != null) onUpdate!();
                    }),
              ),
              SizedBox(
                height: 40,
                width: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.white,
                    ),
                    child: Center(
                        child: Icon(
                      Icons.delete,
                      size: 20,
                      color: Colors.red,
                    )),
                    onPressed: () {
                      if (onDelete != null) onDelete!();
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
