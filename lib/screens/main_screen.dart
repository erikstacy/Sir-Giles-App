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
  @override
  Widget build(BuildContext context) {

    beerList = Provider.of<List<Beer>>(context);

    if (beerList != null) {

      beerList.sort((a, b) => a.name.compareTo(b.name));

      return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('Sir Giles Brewing'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: beerList.length,
                itemBuilder: (context, index) {
                  return BeerCard(beer: beerList[index],);
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

/*
* DataSearch class
********************************************/
class DataSearch extends SearchDelegate<String> {

  List<Beer> beerList;
  
  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Show some result based on the selection
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show when someone searches for something
    beerList = Provider.of<List<Beer>>(context);

    final suggestionList = query.isEmpty ? [] : beerList.where((p) {
      return p.name.toLowerCase().startsWith(query.toLowerCase()) || p.abbreviation.toLowerCase().startsWith(query.toLowerCase()) || p.type.toLowerCase().startsWith(query.toLowerCase());
    }).toList();

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return BeerCard(beer: suggestionList[index],);
        },
      ),
    );
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