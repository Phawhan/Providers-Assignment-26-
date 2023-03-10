import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive/widgets/search_bar.dart';
import '../../providers/countries_provider.dart';
import 'package:responsive/constants/variables.dart';
// import 'package:responsive/';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CountryProvider countryProvider;
  @override
  void initState() {
    super.initState();
    countryProvider = Provider.of<CountryProvider>(context, listen: false);
    countryProvider.count++;
    countryProvider.allCountries.add(
      Country(
        name: "India",
        captial: 'Delhi',
        id: countryProvider.count,
        imageUrl: 'assets/images/india.png',
        states: ["Andhra Pradesh", "Telangana", "Tamil Nadu"],
      ),
    );
    countryProvider.count++;
    countryProvider.allCountries.add(
      Country(
        name: "Sri Lanka",
        captial: 'Columbo',
        id: countryProvider.count,
        imageUrl: 'assets/images/srilanka.png',
        states: [
          "Ampara",
          "Badulla",
          "Colombo Nadu",
          "Gampaha",
          "Hambantota",
        ],
      ),
    );
    countryProvider.count++;
    countryProvider.allCountries.add(
      Country(
        name: "Pakistan",
        captial: 'Islamabad',
        id: countryProvider.count,
        imageUrl: 'assets/images/pakistan.png',
        states: [
          "Quetta",
          "Gilgit",
          "Islamabad",
          "Peshawar",
          "Lahore",
        ],
      ),
    );
    countryProvider.count++;
    countryProvider.allCountries.add(
      Country(
        name: "Austraila",
        captial: 'Columbo',
        id: countryProvider.count,
        imageUrl: 'assets/images/austraila.png',
        states: [
          "Ampara",
          "Badulla",
          "Colombo Nadu",
          "Gampaha",
          "Hambantota",
        ],
      ),
    );
    countryProvider.count++;
    countryProvider.allCountries.add(
      Country(
        name: "South Africa",
        captial: 'Pretoria',
        id: countryProvider.count,
        imageUrl: 'assets/images/southafrica.jpg',
        states: [
          "Eastern Cape",
          "Gauteng",
          "Limpopo",
          "Mpumalanga",
          "North West",
        ],
      ),
    );
    countryProvider.count++;
    countryProvider.allCountries.add(
      Country(
        name: "West Indies",
        captial: 'Chaguaramas',
        id: countryProvider.count,
        imageUrl: 'assets/images/austraila.png',
        states: [
          "Ampara",
          "Badulla",
          "Colombo Nadu",
          "Gampaha",
          "Hambantota",
        ],
      ),
    );
    countryProvider.count++;
    countryProvider.allCountries.add(
      Country(
        name: "Bangladesh",
        captial: 'Columbo',
        id: countryProvider.count,
        imageUrl: 'assets/images/srilanka.png',
        states: [
          "Ampara",
          "Badulla",
          "Colombo Nadu",
          "Gampaha",
          "Hambantota",
        ],
      ),
    );
    countryProvider.count++;
    countryProvider.allCountries.add(
      Country(
        name: "Newzealand",
        captial: 'Columbo',
        id: countryProvider.count,
        imageUrl: 'assets/images/srilanka.png',
        states: [
          "Ampara",
          "Badulla",
          "Colombo Nadu",
          "Gampaha",
          "Hambantota",
        ],
      ),
    );
    countryProvider.displayCountries = countryProvider.allCountries;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CountryProvider>(
      builder: (BuildContext context, value, Widget? child) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Text("Countries"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SearchBar(),
            SizedBox(
              height: 400,
              width: 500,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Table(
                  columnWidths: const {
                    0: FixedColumnWidth(20),
                    1: FlexColumnWidth(),
                    2: FlexColumnWidth(),
                    3: FixedColumnWidth(50)
                  },
                  children: [
                    for (int index = 0;
                        index < value.displayCountries.length;
                        index++)
                      TableRow(
                        children: [
                          Text(value.displayCountries[index].id.toString()),
                          Text(value.displayCountries[index].name),
                          Text(value.displayCountries[index].captial),
                          ElevatedButton(
                            onPressed: () {
                              print(value.displayCountries[index].id);
                              Navigator.pushNamed(context, "details",
                                  arguments: value.displayCountries[index].id);
                            },
                            child: const Icon(Icons.edit),
                          )
                        ],
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
