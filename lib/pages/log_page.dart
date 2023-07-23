import 'package:flutter_time_tracker/database/database_helper.dart';
import 'package:flutter_time_tracker/models/entry.dart';
import 'package:flutter/material.dart';

class LogPage extends StatefulWidget {
  @override
  LogPageState createState() => LogPageState();
}

class LogPageState extends State<LogPage> {
  List<Entry> list = [];
  List<DataRow> dataRows = [];
  var db = DatabaseHelper();
  List<Map<String, dynamic>> entryList = [];

  @override
  void initState() {
    super.initState();
    db.getAllEntries().then((entries) {
      setState(() {
        entries.forEach((entry) {
          list.add(Entry.fromMap(entry));
        });
        list.sort((a, b) => a.endDateTime.compareTo(b.endDateTime));
      });
    });
  }

  Widget dataBody() => DataTable(
        columns: [
          DataColumn(
            label: Text(
              "Weekday",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            numeric: false,
            onSort: (i, b) => {},
          ),
          DataColumn(
            label: Text(
              "Date",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            numeric: false,
            onSort: (i, b) => () {
              setState(() {
                list.sort((a, b) => a.endDateTime.compareTo(b.endDateTime));
              });
            },
          ),
          DataColumn(
            label: Text(
              "Time",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            numeric: false,
            onSort: (i, b) => () {
              setState(() {
                list.sort((a, b) =>
                    a.durationInMinutes.compareTo(b.durationInMinutes));
              });
            },
          ),
        ],
        sortColumnIndex: 1,
        onSelectAll: (value) {},
        rows: list
            .map(
              (entry) => DataRow(
                cells: <DataCell>[
                  DataCell(
                    Text(entry.getDay().toString()),
                    showEditIcon: false,
                  ),
                  DataCell(
                    Text(entry.getDate()),
                    showEditIcon: false,
                  ),
                  DataCell(
                    Text(entry.hourMinutes()),
                    showEditIcon: false,
                  ),
                ],
              ),
            )
            .toList(),
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: dataBody());
  }
}
