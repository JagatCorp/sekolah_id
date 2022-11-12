import 'package:flutter/material.dart';
import 'package:sekolah_id/mapel/mapel-mtk.dart';
import 'package:sekolah_id/qr/qr.dart';

import '../core/utils/constant.dart';
import '../core/utils/custom_path.dart';
import '../core/utils/navigator_helper.dart';

class MataPelajaran extends StatefulWidget {
  const MataPelajaran({super.key});

  @override
  State<MataPelajaran> createState() => _MataPelajaranState();
}

final index = 0;

class _MataPelajaranState extends State<MataPelajaran> {
  final List mapel = [
    'Matematika',
    'TIK',
    'IPA',
    'Bahasa Inggris',
    'PPKN',
  ];
  final List guru = [
    'yayah, S.pd, S,Kom, S.H, S.Ked ',
    'Fahmi S.Kom',
    'Iqro Negoro S,pd',
    'Didik Nurul S,pd',
    'Abdul Majid S.pd'
  ];
  List pages = [MapelMtk()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Mata Pelajaran",
          style: TextStyle(
              fontSize: size / 20,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              goBack();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              size: size / 20,
              color: Colors.black,
            )),
      ),
      body: Container(
        padding: EdgeInsets.only(
            left: width / 20, right: width / 20, top: width / 20),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: width / 20, right: width / 20),
                filled: true,
                hintText: "Cari Mata Pelajaran......",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: mapel.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        height: height / 6.5,
                        width: width / 1.1,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Stack(children: [
                          Positioned(
                            child: ClipPath(
                              clipper: CustumPathBottom(),
                              child: Container(
                                height: 130,
                                width: 350,
                                decoration: BoxDecoration(
                                    color: Color(0xff00AEA7),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20))),
                              ),
                            ),
                          ),
                          Positioned(
                            child: ClipPath(
                              clipper: CustumPathTop(),
                              child: Container(
                                height: 130,
                                width: 350,
                                decoration: BoxDecoration(
                                    color: Color(0xff15C0B9),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                              ),
                            ),
                          ),
                          Positioned(
                              left: width / 17,
                              top: height / 55,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    mapel[index],
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    guru[index],
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ))
                        ]),
                      ),
                      SizedBox(
                        height: height / 50,
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
