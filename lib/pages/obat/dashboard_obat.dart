import 'package:flutter/material.dart';
import 'package:pkl_satunadi/pages/home_page.dart';
import 'package:pkl_satunadi/pages/obat/acarbose.dart';
import 'package:pkl_satunadi/pages/obat/betadine.dart';
import 'package:pkl_satunadi/pages/obat/cataflam.dart';
import 'package:pkl_satunadi/pages/obat/dulcolax.dart';
import 'package:pkl_satunadi/pages/obat/entrostop.dart';
import 'package:pkl_satunadi/pages/obat/furosemide.dart';
import 'package:pkl_satunadi/pages/obat/glimepiride.dart';
import 'package:pkl_satunadi/pages/obat/hufagripp.dart';
import 'package:pkl_satunadi/pages/obat/ibuprofen.dart';
import 'package:pkl_satunadi/pages/obat/januvia.dart';
import 'package:pkl_satunadi/pages/obat/konidin.dart';
import 'package:pkl_satunadi/pages/obat/lameson.dart';
import 'package:pkl_satunadi/pages/obat/metformin.dart';
import 'package:pkl_satunadi/pages/obat/nerobion.dart';
import 'package:pkl_satunadi/pages/obat/oralit.dart';
import 'package:pkl_satunadi/pages/obat/paracetamol.dart';
import 'package:pkl_satunadi/pages/obat/ropinirole.dart';
import 'package:pkl_satunadi/pages/obat/sagestam.dart';
import 'package:pkl_satunadi/pages/obat/tramadol.dart';
import 'package:pkl_satunadi/pages/obat/ultraflu.dart';
import 'package:pkl_satunadi/pages/obat/vardenafil.dart';
import 'package:pkl_satunadi/pages/obat/warfarin.dart';
import 'package:pkl_satunadi/pages/obat/xalatan.dart';
import 'package:pkl_satunadi/pages/obat/yodium.dart';
import 'package:pkl_satunadi/pages/obat/zoralin.dart';

class ObatScreen extends StatefulWidget {
  const ObatScreen({Key? key}) : super(key: key);

  @override
  State<ObatScreen> createState() => _ObatScreenState();
}

class _ObatScreenState extends State<ObatScreen> {
  TextEditingController searchController = TextEditingController();
  List<String> obatList = [
    'Acarbose',
    'Betadine',
    'Cataflam',
    'Dulcolax',
    'Entrostop',
    'Furosemide',
    'Glimepiride',
    'Hufagripp',
    'Ibuprofen',
    'Januvia',
    'Konidin',
    'Lameson',
    'Metformin',
    'Nerobion',
    'Oralit',
    'Paracetamol',
    'Ropinirole',
    'Sagestam',
    'Tramadol',
    'Ultraflu',
    'Vardenafil',
    'Warfarin',
    'Xalatan',
    'Yodium',
    'Zoralin',
  ];
  List<String> filteredObatList = [];

  @override
  void initState() {
    super.initState();
    filteredObatList = obatList;
    searchController.addListener(() {
      filterSearchResults(searchController.text);
    });
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>.from(obatList);
    if (query.isNotEmpty) {
      List<String> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        filteredObatList = dummyListData;
      });
      return;
    } else {
      setState(() {
        filteredObatList = obatList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3B636E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        title: const Text(
          'Informasi Obat',
          style: TextStyle(
            fontFamily: 'Nunito-Bold',
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15, bottom: 20),
          width: size.width * 0.86,
          height: 55,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFF3F8FE),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextFormField(
            controller: searchController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Silahkan cari obat yang diinginkan",
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
              ),
              prefixIcon: const Icon(
                Icons.search,
                size: 25,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 28.0, bottom: 10.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Pilihan Obat",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            itemCount: filteredObatList.length +
                1, // Increase the count by 1 to add the SizedBox at the end
            itemBuilder: (context, index) {
              if (index == filteredObatList.length) {
                return SizedBox(
                    height: 30); // Add a SizedBox at the end of the list
              }
              return ObatCard(
                obatName: filteredObatList[index],
                onTap: () {
                  if (filteredObatList[index] == 'Acarbose') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AcarboseScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Betadine') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BetadineScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Cataflam') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CataflamScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Dulcolax') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DulcolaxScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Entrostop') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EntrostopScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Furosemide') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FurosemideScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Glimepiride') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GlimepirideScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Hufagripp') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HufagrippScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Ibuprofen') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IbuprofenScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Januvia') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const JanuviaScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Konidin') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const KonidinScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Lameson') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LamesonScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Metformin') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MetforminScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Nerobion') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NerobionScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Oralit') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OralitScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Paracetamol') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ParacetamolScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Ropinirole') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RopiniroleScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Sagestam') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SagestamScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Tramadol') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TramadolScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Ultraflu') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UltrafluScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Vardenafil') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VardenafilScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Warfarin') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WarfarinfilScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Xalatan') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const XalatanfilScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Yodium') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const YodiumfilScreen()),
                    );
                  }
                  if (filteredObatList[index] == 'Zoralin') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ZoralinScreen()),
                    );
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class ObatCard extends StatelessWidget {
  final String obatName;
  final VoidCallback onTap;

  const ObatCard({Key? key, required this.obatName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(left: 20, top: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          obatName,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
