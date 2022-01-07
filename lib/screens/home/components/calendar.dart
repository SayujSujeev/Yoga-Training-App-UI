import 'dart:convert';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:UnivTodo/constants/constants.dart';
import 'package:UnivTodo/data/data.dart';
import 'package:UnivTodo/models/style.dart';


class DynamicEvent extends StatefulWidget {
  @override
  _DynamicEventState createState() => _DynamicEventState();
}

class _DynamicEventState extends State<DynamicEvent> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
    prefsData();
  }

  prefsData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.getString("events") ?? "{}")));
    });
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }
  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        title: Text('🔖 나의 투두 리스트'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            TableCalendar(
              events: _events,
              initialCalendarFormat: CalendarFormat.week,
              calendarStyle: CalendarStyle(
                  canEventMarkersOverflow: true,
                  todayColor: Colors.blueGrey.withOpacity(0.85),
                  selectedColor: Theme.of(context).primaryColorDark,
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                      color: Colors.white)),

              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(18.0),
                  border: Border.all(
                    width: 1,
                    color: Colors.black.withOpacity(0.6)
                  ),
                ),

                formatButtonTextStyle: TextStyle(color: Colors.white),
                formatButtonShowsNext: false,

              ),

              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events,holidays) {
                setState(() {
                  _selectedEvents = events;
                });
              },

              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(0.38),
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                todayDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: blueGrey.withOpacity(0.62),
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              calendarController: _controller,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ..._selectedEvents.map((event) => Padding(
              padding: const EdgeInsets.all(4.0),

              child: Container(
                height: MediaQuery.of(context).size.height/20,
                width: MediaQuery.of(context).size.width*0.98,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white.withOpacity(0.6),
                    border: Border.all(color: Colors.blueGrey.withOpacity(0.1))
                ),
                child: Center(
                    child: Text(event,
                      style: TextStyle(color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,fontSize: 13),)
                ),

              ),

            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add),
        onPressed: _showAddDialog,
      ),
    );
  }

  _showAddDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.white70,
          title: Text("투두 추가하기"),
          content: TextField(
            controller: _eventController,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("저장하기",style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold)),
              onPressed: () {
                if (_eventController.text.isEmpty) return;
                setState(() {
                  if (_events[_controller.selectedDay] != null) {
                    _events[_controller.selectedDay]
                        .add(_eventController.text);
                  } else {
                    _events[_controller.selectedDay] = [
                      _eventController.text
                    ];
                  }
                  prefs.setString("events", json.encode(encodeMap(_events)));
                  _eventController.clear();
                  Navigator.pop(context);
                });

              },
            )
          ],
        ));
  }
}