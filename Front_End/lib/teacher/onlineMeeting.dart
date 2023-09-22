import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

const zoomClientId = 'M_QTC7O4RFa_LYCzsRy9Ow';
const zoomClientSecret = 'CRuUVFzuWyP2hztOQJ9LMYA7jXMcCE24';

class ZoomMeetingPage extends StatefulWidget {
  @override
  _ZoomMeetingPageState createState() => _ZoomMeetingPageState();
}

class _ZoomMeetingPageState extends State<ZoomMeetingPage> {
  String? accessToken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 208, 231, 244),
          iconTheme: IconThemeData(color: Colors.black),
          title: Image.asset(
            "images/logo.jpeg",
            width: 160,
          ),
        ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 208, 231, 244)),
          onPressed: () {
            // Initiate the OAuth flow to obtain an access token
            initiateOAuthFlow();
          },
          child: Text('Start Zoom Meeting'),
        ),
      ),
    );
  }

  Future<void> initiateOAuthFlow() async {
    final redirectUri =
        Uri.encodeFull('YOUR_REDIRECT_URI'); // Replace with your redirect URI
    final authUrl = Uri.parse('https://us05web.zoom.us/meeting#/upcoming'
        'response_type=code'
        '&client_id=$zoomClientId'
        '&redirect_uri=$redirectUri');

    // Open the user's web browser to authenticate and authorize your app
    if (await canLaunch(authUrl.toString())) {
      await launch(authUrl.toString());

      // The user will complete the OAuth flow in the browser and return with an authorization code.
      // Implement the logic to exchange the code for an access token.
    } else {
      // Handle the case where the URL cannot be launched.
    }
  }

  Future<void> exchangeCodeForAccessToken(String code) async {
    final tokenUrl = Uri.parse('https://zoom.us/oauth/token');
    final response = await http.post(
      tokenUrl,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'code': code,
        'client_id': zoomClientId,
        'client_secret': zoomClientSecret,
        'grant_type': 'authorization_code',
        'redirect_uri': 'YOUR_REDIRECT_URI', // Replace with your redirect URI
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final newAccessToken = data['access_token'];

      // Now you have the access token to create and start Zoom meetings.
      setState(() {
        accessToken = newAccessToken;
      });
    } else {
      // Handle the case where the code exchange fails.
    }
  }
}
