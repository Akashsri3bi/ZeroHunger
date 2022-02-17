import 'package:flutter/material.dart';
import 'package:hunger/models/time_shift.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Help extends StatefulWidget {
  static double value = 0;
  static String? selected;
  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  bool choice = false;
  BorderRadiusGeometry radius = const BorderRadius.only(
    topLeft: Radius.circular(24.0),
    topRight: Radius.circular(24.0),
  );

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    TextEditingController addresscontroller = TextEditingController();
    TextEditingController numbercontroller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: SlidingUpPanel(
        minHeight: Help.value,
        maxHeight: MediaQuery.of(context).size.height - 200,
        borderRadius: radius,
        panel: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: (choice)
                      ? Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Volunteer',
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.stars,
                                    color: Colors.yellow[800],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextField(
                                controller: controller,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    hintText: "Selin Doga",
                                    contentPadding: const EdgeInsets.only(
                                        left: 20.0, bottom: 5.0, top: 12.5),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.green)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.white))),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Email',
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.stars,
                                    color: Colors.yellow[800],
                                  ),
                                ],
                              ),
                              TextField(
                                controller: addresscontroller,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    hintText: "Enter email",
                                    contentPadding: const EdgeInsets.only(
                                        left: 20.0, bottom: 5.0, top: 12.5),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.red)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.white))),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Contact ',
                                      style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      child: TextField(
                                        controller: numbercontroller,
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.grey[200],
                                            hintText: "phone no.",
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    left: 20.0,
                                                    bottom: 5.0,
                                                    top: 12.5),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color: Colors.green)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color: Colors.white))),
                                      ),
                                    ),
                                  ]),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Select Shift',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Container(
                                        height: 35,
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                              color: Colors.green, width: 1),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                              iconSize: 30,
                                              icon: const Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.black,
                                              ),
                                              items: TimeShift.items
                                                  .map(buildMenuItem)
                                                  .toList(),
                                              value: Help.selected,
                                              isExpanded: true,
                                              onChanged: (value) =>
                                                  setState(() {
                                                    Help.selected = value;
                                                  })),
                                        )),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.black.withOpacity(0.9),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        Help.value = 0;
                                      });
                                    },
                                    child: const Text(
                                      'Later',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'lato',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red[500],
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50),
                                    ),
                                    onPressed: () {
                                      if (controller.text.isNotEmpty &&
                                          addresscontroller.text.isNotEmpty &&
                                          numbercontroller.text.isNotEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text(
                                              'Welcome  , We will contact you soon'),
                                          behavior: SnackBarBehavior.floating,
                                        ));
                                        setState(() {
                                          Help.value = 0;
                                        });
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content:
                                              Text('Please fill all details !'),
                                          behavior: SnackBarBehavior.floating,
                                        ));
                                      }
                                    },
                                    child: const Text(
                                      'Volunteer',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'lato',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Restaurant Name',
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.stars,
                                    color: Colors.yellow[800],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextField(
                                controller: controller,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    hintText: "Awantika restaurant",
                                    contentPadding: const EdgeInsets.only(
                                        left: 20.0, bottom: 5.0, top: 12.5),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.green)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.white))),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Address',
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.stars,
                                    color: Colors.yellow[800],
                                  ),
                                ],
                              ),
                              Container(
                                height: 100,
                                child: TextField(
                                  controller: addresscontroller,
                                  expands: true,
                                  minLines: null,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey[200],
                                      hintText: "Address",
                                      contentPadding: const EdgeInsets.only(
                                          left: 20.0, bottom: 5.0, top: 12.5),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.red)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.white))),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Contact ',
                                      style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      child: TextField(
                                        controller: numbercontroller,
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.grey[200],
                                            hintText: "phone no.",
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    left: 20.0,
                                                    bottom: 5.0,
                                                    top: 12.5),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color: Colors.green)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color: Colors.white))),
                                      ),
                                    ),
                                  ]),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.black.withOpacity(0.9),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        Help.value = 0;
                                      });
                                    },
                                    child: const Text(
                                      'Later',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'lato',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.green[500],
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50),
                                    ),
                                    onPressed: () {
                                      if (controller.text.isNotEmpty &&
                                          addresscontroller.text.isNotEmpty &&
                                          numbercontroller.text.isNotEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text(
                                              'Welcome  , We will contact you soon'),
                                          behavior: SnackBarBehavior.floating,
                                        ));
                                        setState(() {
                                          Help.value = 0;
                                        });
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content:
                                              Text('Please fill all details !'),
                                          behavior: SnackBarBehavior.floating,
                                        ));
                                      }
                                    },
                                    child: const Text(
                                      'Done',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'lato',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
            ],
          ),
        ),
        //Body behind the panel
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/helping.png'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Hey Restaurants ,',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 30, left: 30),
                  child: Center(
                    child: Text(
                      'Integrate with us to collect food ',
                      style: TextStyle(color: Colors.grey, fontSize: 24),
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'material',
                    style: TextStyle(color: Colors.grey, fontSize: 24),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black.withOpacity(0.9),
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                      ),
                      onPressed: () {
                        setState(() {
                          Help.value = 380;
                          choice = false;
                        });
                      },
                      child: const Text(
                        'Join Us',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'lato',
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                ),
                const SizedBox(
                  height: 5,
                ),
                Divider(
                  height: 20,
                  thickness: 10,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Hey Volunteers ,',
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colors.red),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 30, left: 30),
                  child: Center(
                    child: Text(
                      'Become a delivery partner and',
                      style: TextStyle(color: Colors.grey, fontSize: 24),
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'Serve the community',
                    style: TextStyle(color: Colors.grey, fontSize: 24),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red.withOpacity(0.7),
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                      ),
                      onPressed: () {
                        setState(() {
                          Help.value = 380;
                          choice = true;
                        });
                      },
                      child: const Text(
                        'Volunteer',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'lato',
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ));
}
