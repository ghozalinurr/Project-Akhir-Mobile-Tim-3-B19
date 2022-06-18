import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pamob/itemkelola.dart';

class KelolaTips extends StatelessWidget {
  final TextEditingController judulController = TextEditingController();
  final TextEditingController isiController = TextEditingController();
  final TextEditingController tingkatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference tips = firestore.collection("tips");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF009393),
          title: Text(
            'Kelola Tips',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Color(0xFF016170),
        body: Stack(
          children: [
            ListView(
              children: [
                //// VIEW DATA HERE
                StreamBuilder<QuerySnapshot>(
                  stream: tips.snapshots(),
                  builder: (_, snapshot) {
                    return (snapshot.hasData)
                        ? Column(
                            children: snapshot.data!.docs
                                .map(
                                  (e) => ItemCard(
                                    e.get('judul'),
                                    e.get('isi'),
                                    e.get('tingkat'),
                                    onUpdate: () {
                                      tips.doc(e.id).update(
                                        {'tingkat': e.get('tingkat') + 2},
                                      );
                                    },
                                    onDelete: () {
                                      tips.doc(e.id).delete();
                                    },
                                  ),
                                )
                                .toList(),
                          )
                        : Text("Loading");
                  },
                ),
                SizedBox(height: 150)
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              controller: judulController,
                              decoration: InputDecoration(hintText: "Judul"),
                            ),
                            TextField(
                              controller: isiController,
                              decoration: InputDecoration(hintText: "Isi"),
                              //keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 120,
                        padding: const EdgeInsets.fromLTRB(15, 15, 0, 25),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF009393),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Tambah',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              //// ADD DATA HERE
                              tips.add({
                                'judul': judulController.text,
                                'isi': isiController.text,
                                'tingkat':
                                    int.tryParse(tingkatController.text) ?? 0
                              });
                              judulController.text = '';
                              isiController.text = '';
                            }),
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }
}
