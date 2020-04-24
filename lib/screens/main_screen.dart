import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sir_giles_brewing/services/models.dart';
import 'package:sir_giles_brewing/services/theme.dart';

class MainScreen extends StatefulWidget {

  static String id = 'main_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<Beer> beerList;
  List<Beer> searchList;
  bool isFirst;

  @override
  void initState() {
    super.initState();

    isFirst = true;
  }

  @override
  Widget build(BuildContext context) {

    beerList = Provider.of<List<Beer>>(context);
    if (isFirst) {
      searchList = beerList;
      isFirst = false;
    }

    if (beerList != null) {

      searchList.sort((a, b) => a.name.compareTo(b.name));

      return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('Sir Giles Brewing'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                onChanged: (value) {
                  List<Beer> tempList = [];
                  for (Beer beer in beerList) {
                    if (beer.name == value) {
                      tempList.add(beer);
                    }
                  }

                  setState(() {
                    searchList = tempList;
                  });
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search by name, type, or abbreviation",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey[700],),
                ),
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: searchList.length,
                itemBuilder: (context, index) {
                  return BeerCard(beer: searchList[index],);
                },
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
  }
}

class BeerCard extends StatelessWidget {

  final Beer beer;

  BeerCard({ this.beer });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        beer.name,
                        style: CustomTheme.beerNameText,
                      ),
                    ),
                    SizedBox(height: 2,),
                    DataSection(label: 'Type', data: beer.type,),
                    SizedBox(height: 2,),
                    DataSection(label: 'Abbreviation', data: beer.abbreviation,),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DataSection extends StatelessWidget {

  final String label;
  final String data;

  DataSection({ this.label, this.data });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          label,
          style: CustomTheme.beerDataText,
        ),
        Text(
          ' - ',
          style: CustomTheme.beerDataText,
        ),
        Text(
          _printData(),
          style: CustomTheme.beerDataText,
        ),
      ],
    );
  }

  String _printData() {
    if (label == 'Abbreviation' && data == "") {
      return "None";
    } else {
      return data;
    }
  }
}