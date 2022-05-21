import 'package:flutter/material.dart';
import 'package:hunger/models/filter.dart';
import 'package:hunger/screens/employment_search_screen.dart';

class EmploymentSearchBox extends StatefulWidget {
  const EmploymentSearchBox({Key? key}) : super(key: key);

  @override
  State<EmploymentSearchBox> createState() => _EmploymentSearchBoxState();
}

class _EmploymentSearchBoxState extends State<EmploymentSearchBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EmploymentSearchScreen(),
                ));
          },
          child: Container(
            width: MediaQuery.of(context).size.width - 80,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Text(
                  'Search for Employment',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.grey[500]),
                )),
                Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: IconButton(
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) {
                  return AlertDialog(
                    title: Text("Filters",
                        style: Theme.of(context).textTheme.headline1),
                    content: StatefulBuilder(builder: (context, setState) {
                      return Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Salary',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: "Roboto",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      Filter.values[0].selected = true;

                                      Filter.values[1].selected = false;
                                      Filter.values[2].selected = false;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(3.0),
                                    height: 25,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      color: Filter.values[0].selected
                                          ? Color.fromARGB(255, 211, 241, 148)
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Any',
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      Filter.values[0].selected = false;
                                      Filter.values[1].selected = true;

                                      Filter.values[2].selected = false;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(3.0),
                                    height: 25,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      color: Filter.values[1].selected
                                          ? Color.fromARGB(255, 211, 241, 148)
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '50000',
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      Filter.values[0].selected = false;
                                      Filter.values[1].selected = false;
                                      Filter.values[2].selected = true;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(3.0),
                                    height: 25,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      color: Filter.values[2].selected
                                          ? Color.fromARGB(255, 211, 241, 148)
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '30000',
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('full time',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontFamily: "Roboto",
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text('permanant',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontFamily: "Roboto",
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Switch(
                                  activeColor:
                                      Color.fromARGB(255, 211, 241, 148),
                                  value: Filter.values[3].selected,
                                  onChanged: (key) {
                                    setState(() {
                                      Filter.values[3].selected = key;
                                    });
                                  },
                                ),
                                Switch(
                                  activeColor:
                                      Color.fromARGB(255, 211, 241, 148),
                                  value: Filter.values[4].selected,
                                  onChanged: (key) {
                                    setState(() {
                                      Filter.values[4].selected = key;
                                    });
                                  },
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            const Text(
                              'Sort_by',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: "Roboto",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      Filter.values[5].selected = true;
                                      Filter.values[6].selected = false;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(3.0),
                                    height: 25,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      color: Filter.values[5].selected
                                          ? Color.fromARGB(255, 211, 241, 148)
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Any',
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      Filter.values[5].selected = false;
                                      Filter.values[6].selected = true;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(3.0),
                                    height: 25,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      color: Filter.values[6].selected
                                          ? Color.fromARGB(255, 211, 241, 148)
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'salary',
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          Filter.filtered = true;
                        },
                        child: const Text("Set Filter"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        )
      ]),
    );
  }
}
