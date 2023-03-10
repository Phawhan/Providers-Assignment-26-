import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/countries_provider.dart';

class DialogBox extends StatefulWidget {
  int index;
  DialogBox({super.key, required this.index});

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  TextEditingController searchTextController = TextEditingController();
  late String searchValue;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CountryProvider>(
      builder: (BuildContext context, value, Widget? child) => AlertDialog(
        title: Text("Do you want to add state ?"),
        content: Container(
          child: TextField(
            controller: searchTextController,
            onChanged: (value) {
              searchValue = value;
            },
            decoration: InputDecoration(),
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                value.addStateToCountry(widget.index, searchValue);
                Navigator.of(context).pop();
              },
              child: Text("Add State"))
        ],
      ),
    );
  }
}
