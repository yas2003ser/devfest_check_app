import 'dart:convert';
import 'dart:developer';

import 'package:check/models/participant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ParticipantDetails extends StatefulWidget {
  const ParticipantDetails(
      {super.key, required this.participant, required this.result});

  final Participant participant;
  final Barcode? result;

  @override
  State<ParticipantDetails> createState() => _ParticipantDetailsState();

  Future<String> checkIn() async {
    try {
      final url =
          Uri.parse("https://devfest-4873bc08093d.herokuapp.com/check/in");
      final Response res = await post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"id": result!.code}),
      );

      if (res.statusCode < 400) {
        // Successful check-in
        final Map<String, dynamic> responseData = jsonDecode(res.body);
        final String message = responseData["message"];
        return message;
      } else {
        final Map<String, dynamic> responseData = jsonDecode(res.body);
        final String message = responseData["message"];
        return message;
      }
    } catch (e) {
      // Handle exceptions
      return "An error occurred during check-in: $e";
    }
  }

  Future<String> checkOut() async {
    try {
      final url =
          Uri.parse("https://devfest-4873bc08093d.herokuapp.com/check/out");
      final Response res = await post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"id": result!.code}),
      );

      if (res.statusCode < 400) {
        // Successful check-in
        final Map<String, dynamic> responseData = jsonDecode(res.body);
        final String message = responseData["message"];
        return message;
      } else {
        final Map<String, dynamic> responseData = jsonDecode(res.body);
        final String message = responseData["message"];
        return message;
      }
    } catch (e) {
      // Handle exceptions
      return "An error occurred during check-in: $e";
    }
  }
}

class _ParticipantDetailsState extends State<ParticipantDetails> {
  @override
  Widget build(BuildContext context) {
    // DateTime? date = DateTime.tryParse(widget.participant.birthDate);
    // String formattedBirthDate = DateFormat("yyyy-MM-dd").format(date!);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset("assets/AppBar.png"),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(child: Image.asset("assets/devfest.png")),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            deatils("Name", widget.participant.name),
            const SizedBox(
              height: 10,
            ),
            deatils("Phone Number", widget.participant.phoneNumber),
            const SizedBox(
              height: 10,
            ),
            deatils("Email", widget.participant.email),
            const SizedBox(
              height: 10,
            ),
            deatils("Team", widget.participant.team),
            const SizedBox(
              height: 10,
            ),
            deatils("Birthday", widget.participant.birthDate.toString()),
            const SizedBox(
              height: 10,
            ),
            deatils("State", widget.participant.state),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () async {
                try {
                  final message = await widget.checkIn();
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog.adaptive(
                              title: const Text("Check In success"),
                              content: Text(message),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(ctx);
                                    },
                                    child: const Text("ok"))
                              ],
                            ));
                  });
                  log(message);

                  // ... rest of your code
                } catch (e) {
                  // Handle exceptions if needed
                  log("Error during check-in: $e");
                }
              },
              child: Image.asset("assets/button2.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                try {
                  final message = await widget.checkOut();
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog.adaptive(
                              title: const Text("Check Out success"),
                              content: Text(message),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(ctx);
                                    },
                                    child: const Text("ok"))
                              ],
                            ));
                  });
                  log(message);

                  // ... rest of your code
                } catch (e) {
                  // Handle exceptions if needed
                  log("Error during check-in: $e");
                }
              },
              child: Image.asset("assets/button1.png"),
            ),
          ],
        ),
      ),
    );
  }

  Container deatils(key, value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.yellow),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$key :",
            style: const TextStyle(fontSize: 17, color: Colors.black),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(value, style: const TextStyle(fontSize: 17, color: Colors.blue)),
        ],
      ),
    );
  }
}
