import 'package:flutter/material.dart';
import 'package:sir_giles_brewing/services/models.dart';
import 'package:sir_giles_brewing/services/theme.dart';

class BeerScreen extends StatefulWidget {

  static String id = 'beer_screen';

  final Beer beer;

  BeerScreen({ this.beer });

  @override
  _BeerScreenState createState() => _BeerScreenState();
}

class _BeerScreenState extends State<BeerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Beer Info'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
            Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20,),
              Text(
                widget.beer.name,
                textAlign: TextAlign.center,
                style: CustomTheme.beerTitleText,
              ),
              SizedBox(height: 10,),
              Text(
                widget.beer.type,
                textAlign: TextAlign.center,
                style: CustomTheme.beerSubText,
              ),
              SizedBox(height: 10,),
              Text(
                widget.beer.abbreviation != "" ? widget.beer.abbreviation : "No Abbreviation",
                textAlign: TextAlign.center,
                style: CustomTheme.beerSubText,
              ),
              SizedBox(height: 10,),
              _InfoCard(label: 'ABV', data: widget.beer.abv,),
              _InfoCard(label: 'Date Created', data: widget.beer.dateCreated,),
              _InfoCard(label: 'Date Final', data: widget.beer.dateFinal,),
              _InfoCard(label: 'Date Secondary', data: widget.beer.dateSecondary,),
              _InfoCard(label: 'Small Bottle', data: widget.beer.smallBottle,),
              _InfoCard(label: 'Large Bottle', data: widget.beer.largeBottle,),
              _InfoCard(label: 'Original Gravity', data: widget.beer.originalGravity,),
              _InfoCard(label: 'Secondary Gravity', data: widget.beer.secondaryGravity,),
              _InfoCard(label: 'Final Gravity', data: widget.beer.finalGravity,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Notes:',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          widget.beer.notes != "" ? widget.beer.notes : "No Notes",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {

  final String label;
  final String data;

  _InfoCard({ this.label, this.data });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                this.label,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                this.data != "" ? this.data : "No Data",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}