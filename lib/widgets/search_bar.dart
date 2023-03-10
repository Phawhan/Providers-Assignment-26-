import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive/providers/countries_provider.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CountryProvider>(
      builder: (BuildContext context, providerInstance, Widget? child) =>
          Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 0),
        child: SizedBox(
          height: 75,
          width: 300,
          child: TextField(
            decoration: const InputDecoration(
              labelText: "Search",
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: Colors.blue)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(color: Colors.blue)),
            ),
            onChanged: (value) =>
                providerInstance.filterCountriesBySearch(value),
          ),
        ),
      ),
    );
  }
}
