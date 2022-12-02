import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const filterPage = "/filter";
  final Function saveFilter;
  final Map<String, bool> currenFilter;
  const FilterScreen(
      {super.key, required this.saveFilter, required this.currenFilter});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.currenFilter['gluten']!;
    _lactoseFree = widget.currenFilter['lactose']!;
    _vegan = widget.currenFilter['vegan']!;
    _vegetarian = widget.currenFilter['vegetarian']!;
  }

  @override
  Widget build(BuildContext context) {
    final routArg = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filter"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  final selectedFilter = {
                    "gluten": _glutenFree,
                    "lactose": _lactoseFree,
                    "vegan": _vegan,
                    "vegetarian": _vegetarian,
                  };
                  widget.saveFilter(selectedFilter);
                },
                child: const Icon(Icons.save)),
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust Your Meal Selection",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              switchList(
                "Gluten-Free",
                "only Includes Gluten-Free meals.",
                _glutenFree,
                (p0) {
                  setState(() {
                    _glutenFree = p0!;
                  });
                },
              ),
              switchList(
                "Vegiterian",
                "only Includes Vegiterian meals.",
                _vegetarian,
                (p1) {
                  setState(() {
                    _vegetarian = p1!;
                  });
                },
              ),
              switchList(
                "Vegan",
                "only Includes Vegan meals.",
                _vegan,
                (p2) {
                  setState(() {
                    _vegan = p2!;
                  });
                },
              ),
              switchList(
                "Lactose - Free",
                "only Includes Lactose-Free meals.",
                _lactoseFree,
                (p3) {
                  setState(() {
                    _lactoseFree = p3!;
                  });
                },
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget switchList(
    String title,
    String description,
    bool currentValue,
    Function(bool?) updateValue,
  ) {
    return SwitchListTile(
        value: currentValue,
        title: Text(title),
        subtitle: Text(
          description,
        ),
        onChanged: updateValue);
  }
}
