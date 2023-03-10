import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/countries_provider.dart';
import 'package:responsive/constants/variables.dart';
import '../widgets/dialog_box.dart';

class DetailsPage extends StatefulWidget {
  int index;

  DetailsPage({super.key, required this.index});
  @override
  State<DetailsPage> createState() => _DetailsPageState(ind: index);
}

class _DetailsPageState extends State<DetailsPage> {
  int ind;
  _DetailsPageState({required this.ind});
  late Country displayCountry;
  late CountryProvider countryProvider;
  @override
  void initState() {
    super.initState();
    countryProvider = Provider.of<CountryProvider>(context, listen: false);
    countryProvider.allCountries.forEach((item) {
      if (item.id == widget.index) {
        displayCountry = item;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CountryProvider>(
      builder: (BuildContext context, value, Widget? child) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Text("Details of the Country"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Country : "),
                    Text(
                      displayCountry.name,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Capital : "),
                    Text(displayCountry.captial),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("States : "),
                    Row(
                      children: [
                        SizedBox(
                          height: 75,
                          width: 150,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: 10,
                                    crossAxisSpacing: 0,
                                    mainAxisSpacing: 0),
                            itemCount: displayCountry.states.length,
                            itemBuilder: (context, index) {
                              return Text(
                                displayCountry.states[index],
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Image(
                image: AssetImage(displayCountry.imageUrl),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext) {
                        return DialogBox(
                          index: displayCountry.id,
                        );
                      });
                },
                child: Text("Add state to the country"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
