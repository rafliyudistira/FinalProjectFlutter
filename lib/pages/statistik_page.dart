import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/model/statistikmodel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Statistik extends StatefulWidget {
  Statistik({super.key});

  @override
  State<Statistik> createState() => _StatistikState();
}

class _StatistikState extends State<Statistik> {
  final streamChart = FirebaseFirestore.instance
      .collection('invoice')
      .snapshots(includeMetadataChanges: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(255, 31, 31, 31),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(17, 40, 0, 0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_outlined,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    tooltip: "Back",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text(
                    "Statistik",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Grafik Penjualan',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              height: 200,
              child: ListView(
                padding: const EdgeInsets.only(left: 15, right: 15),
                children: [
                  StreamBuilder(
                      stream: streamChart,
                      builder: ((context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                              snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Something wrong');
                        }
                        if (snapshot.data == null) {
                          return const Text('Empsty wrong');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text('Loading');
                        }
                        List<Map<String, dynamic>> listChart =
                            snapshot.data!.docs.map(
                          (e) {
                            return {
                              'domain': e.data()['date'],
                              'measure': e.data()['totalHarga']
                            };
                          },
                        ).toList();
                        return AspectRatio(
                          aspectRatio: 16 / 9,
                          child: DChartBar(
                            data: [
                              {
                                'id': 'Bar',
                                'data': listChart,
                              }
                            ],
                            animationDuration:
                                const Duration(milliseconds: 600),
                            domainLabelColor: Colors.white,
                            measureLabelColor: Colors.white,
                            axisLineColor: Colors.white,
                            barColor: ((barData, index, id) =>
                                Color(0xFFF1C950)),
                            showBarValue: true,
                          ),
                        );
                      })),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
