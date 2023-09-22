import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

class Event {
  final String title;
  Event({required this.title});
}

class SchoolCalendarScreen extends StatefulWidget {
  @override
  _SchoolCalendarScreenState createState() => _SchoolCalendarScreenState();
}

class _SchoolCalendarScreenState extends State<SchoolCalendarScreen> {
  final Map<DateTime, List<Event>> events = {};
  TextEditingController _eventController = TextEditingController();
  late final ValueNotifier<List<Event>> _selectedEvents;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  void dispose() {
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });

      final response = await http.get(
        Uri.parse(
            'http://127.0.0.1:8000/api/events?date=${selectedDay.toIso8601String()}'),
      );

      if (response.statusCode == 200) {
        final List<Event> fetchedEvents = (json.decode(response.body) as List)
            .map((data) => Event(title: data['title']))
            .toList();

        setState(() {
          _selectedEvents.value = fetchedEvents;
        });
      } else {
        throw Exception('Failed to load events');
      }
    }
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Return events for the selected day
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 208, 231, 244),
        title: Image.asset(
          "images/logo.jpeg",
          width: 160,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 208, 231, 244),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                scrollable: true,
                title: Text(
                  "Event Name",
                  style: TextStyle(color: Colors.black),
                ),
                content: Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    controller: _eventController,
                  ),
                ),
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 208, 231,
                          244), // Change the background color of the button
                    ),
                    onPressed: () async {
                      if (_eventController.text.isNotEmpty) {
                        final response = await http.post(
                          Uri.parse('http://127.0.0.1:8000/api/events'),
                          headers: {"Content-Type": "application/json"},
                          body: json.encode({
                            "title": _eventController.text,
                            "date": _selectedDay!.toIso8601String()
                          }),
                        );

                        if (response.statusCode == 201) {
                          setState(() {
                            events[_selectedDay!] = [
                              ...(_selectedEvents.value),
                              Event(title: _eventController.text)
                            ];
                            _selectedEvents.value =
                                _getEventsForDay(_selectedDay!);
                          });

                          Navigator.of(context).pop();
                          _eventController.clear();
                        } else {
                          throw Exception('Failed to create an event');
                        }
                      }
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime(2023),
            lastDay: DateTime(2024),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarFormat: _calendarFormat,
            onDaySelected: _onDaySelected,
            startingDayOfWeek: StartingDayOfWeek.thursday,
            eventLoader: _getEventsForDay,
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
            ),
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              setState(() {
                _focusedDay = focusedDay;
              });
            },
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        onTap: () => print(""),
                        title: Text('${value[index].title}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
