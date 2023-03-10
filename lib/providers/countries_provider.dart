import 'package:flutter/cupertino.dart';
import 'package:responsive/constants/variables.dart';
import 'package:responsive/constants/variables.dart';

class CountryProvider extends ChangeNotifier {
  List<Country> allCountries = [];
  List<Country> displayCountries = [];
  int count = 0;

  addStateToCountry(int index, String newCountry) {
    allCountries.forEach((item) {
      if (item.id == index) {
        item.states.add(newCountry);
        ;
      }
    });
    notifyListeners();
  }

  filterCountriesBySearch(String searchValue) {
    List<Country> dummy = [];
    if (searchValue.isNotEmpty) {
      allCountries.forEach((item) {
        if (item.name.toLowerCase().contains(searchValue) ||
            item.captial.toLowerCase().contains(searchValue)) {
          dummy.add(item);
        }
      });
      displayCountries = dummy;
      notifyListeners();
    } else {
      displayCountries = allCountries;
      notifyListeners();
    }
  }

  notifyListeners();
}
