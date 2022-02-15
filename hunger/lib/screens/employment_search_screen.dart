import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hunger/models/employment_details.dart';
import 'package:hunger/models/filter.dart';
import 'package:hunger/repository/employment_repo.dart';
import 'package:hunger/widgets/job_details_card.dart';

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
                      try {
                        return JobDetailsCard(
                            result: Employment.searchResults[index]);
                      } catch (e) {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  )
                : ListView.builder(
                    itemCount: Employment.userSearches.length,
                    itemBuilder: (context, index) {
                      return JobDetailsCard(
                          result: Employment.userSearches[index]);
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
    List<Result> results = [];
    if (Filter.filtered) {
      String salary_min = 'any';
      int i = 0;
      while (i < 3) {
        if (Filter.values[i].selected) {
          salary_min = Filter.values[i].value;
        }
        i++;
      }
      String sort_by = "any";
      int j = 5;
      while (j <= 6) {
        if (Filter.values[i].selected) {
          sort_by = Filter.values[i].value;
        }
        j++;
      }
      results = await EmploymentRepository.getFilteredJobs(
          text, salary_min, sort_by, true, true);
    } else {
      results = await EmploymentRepository.getJobs(text);
    }
    for (Result result in results) {
      Employment.searchResults.add(result);
    }
    setState(() {});
  }
}
