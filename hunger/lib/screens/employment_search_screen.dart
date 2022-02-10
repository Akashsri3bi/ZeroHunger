import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunger/models/employment_details.dart';
import 'package:hunger/repository/employment_repo.dart';

class EmploymentSearchScreen extends StatefulWidget {
  @override
  State<EmploymentSearchScreen> createState() => _EmploymentSearchScreenState();
}

class _EmploymentSearchScreenState extends State<EmploymentSearchScreen> {
  TextEditingController controller = TextEditingController();

  /*@override
  void initState() {
    super.initState();
    EmploymentRepository.getJobs();
  }*/

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: double.infinity,
              child: TextField(
                controller: controller,
                autofocus: true,
                onChanged: onSearchTextChanged,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search for Employment",
                    suffixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).primaryColor,
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 20.0, bottom: 5.0, top: 12.5),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.green)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white))),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Employment.searchResults.isNotEmpty ||
                    controller.text.isNotEmpty
                ? ListView.builder(
                    itemCount: Employment.searchResults.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(Employment.searchResults[index].jobs),
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: Employment.employments.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(Employment.employments[index].jobs),
                      );
                    },
                  ),
          ),
        ]),
      ),
    );
  }

  onSearchTextChanged(String text) async {
    Employment.searchResults.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    Employment.employments.forEach((job) {
      if (job.jobs.toLowerCase().contains(text.toLowerCase())) {
        Employment.searchResults.add(job);
      }
    });

    setState(() {});
  }
}
