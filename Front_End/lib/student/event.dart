import 'package:flutter/material.dart';

class Event {
  final String title;
  final String date;
  final String description;

  Event(this.title, this.date, this.description);
}

class Events extends StatelessWidget {
  final List<Event> events = [
    Event("Seminar on Science", "October 15, 2023",
        "Join us for an informative seminar on the latest advancements in science."),
    Event("Music Festival", "November 5, 2023",
        "Get ready for a night of music, fun, and dancing at our annual music festival."),
    Event("Career Fair", "December 10, 2023",
        "Explore career opportunities and network with potential employers at our career fair."),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Show Events',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 208, 231, 244),
          title: Image.asset(
            "images/logo_retina.png",
            width: 160,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context)
                  .pop(); // Navigate back to the previous screen
            },
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              "images/event.jpg",
              width: 300, // Adjust the width as needed
              height: 200, // Adjust the height as needed
            ),
            Expanded(
              child: EventList(events),
            ),
          ],
        ),
      ),
    );
  }
}

class EventList extends StatelessWidget {
  final List<Event> events;

  EventList(this.events);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return EventItem(events[index]);
      },
    );
  }
}

class EventItem extends StatelessWidget {
  final Event event;

  EventItem(this.event);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(event.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Date: ${event.date}"),
          Text(event.description),
        ],
      ),
    );
  }
}
