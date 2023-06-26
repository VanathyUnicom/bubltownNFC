import 'package:bubltown_nfc/common/responsive.dart';
import 'package:bubltown_nfc/ui/screens/event/event_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/app.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EventView extends StatelessWidget {
  // final String? myurl;
  // final String? para1;
  // final String? para2;

  // const EventView({super.key,required this.myurl,required this.para1,required this.para2});
  const EventView({super.key});

  @override
  Widget build(BuildContext context) => ViewModelBuilder<EventViewModel>.reactive(
        viewModelBuilder: () => EventViewModel(),
        builder: (BuildContext context, EventViewModel model, Widget? child) => Scaffold(
          body: model.isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(child: Responsive.isDesktop(context) ? _WebUI() : _MobileUI()),
        ),
        onViewModelReady: (viewModel) => viewModel.onInit(),
      );
}

// ignore: must_be_immutable
class _WebUI extends ViewModelWidget<EventViewModel> {
  _WebUI();

  @override
  Widget build(BuildContext context, EventViewModel model) => Container(
      padding: const EdgeInsets.fromLTRB(300, 0, 300, 0),
      //color: Colors.white,
      child: _MobileUI());
}

// ignore: must_be_immutable
class _MobileUI extends ViewModelWidget<EventViewModel> {
  _MobileUI();

  @override
  Widget build(BuildContext context, EventViewModel model) => Padding(
        padding: MediaQuery.of(context).size.width >= 850 && MediaQuery.of(context).size.width < 1100
            ? const EdgeInsets.fromLTRB(100.0, 0, 100.0, 0)
            : const EdgeInsets.all(0.0),
        child: Column(
          children: [
          //   Container(
          //     height: 300,
          //  width: 600,
          //   // decoration: BoxDecoration(
          //   //  // image: DecorationImage(image: NetworkImage(model.event!.images![0]),fit: BoxFit.contain))

          //   // )
          //   child: Image.network(model.event!.images![0],fit: BoxFit.cover,),
          //   ),
            //Text('$para1'),
            Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Center(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "${model.vendor!.name} is hosting a new event near you",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  )),
                  const SizedBox(height: 8.0),
                 // Text(model.event!.eventContactNumber!),
                  const SizedBox(height: 16.0),
                  Center(
                      child: Image.asset(
                    'assets/png/demotown-lg.png',
                    width: 100,
                    height: 100,
                  )),
                  const SizedBox(height: 32.0),
                  CustomPaint(
                    painter: MyPainter(),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: const [
                          Center(
                              child: Text(
                            "Hi {customerName},",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          )),
                          SizedBox(
                            height: 8,
                          ),
                          Center(
                            child: Text(
                              "Here's a new event near you!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 48.0),
                  // RichText(
                  //   text: const TextSpan(
                  //     text: "{vendorName}",
                  //     style: TextStyle(fontWeight: FontWeight.bold)
                  //     ),
                  //   children:<TextSpan>[TextSpan(text: " just added a brand new event on {channelName}. click below to register while spots last!"),],
                  // )
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RichText(
                      text:  TextSpan(
                        text: model.vendor!.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                            text: ' just added a brand new event on {channelName }. click below to register while spots last!',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(50, 10, 50, 30),
                      child: Container(
                        height: Responsive.isDesktop(context) ? 200 : 120,
                        width: Responsive.isDesktop(context) ? 300 : 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image:   DecorationImage(
                            image: NetworkImage(model.event!.images![0]),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),

                   Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                    child: Text(
                      model.event!.name!.toString(),
                      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                    child: Text(
                      "By ${model.vendor!.name}",
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xffFF2C9C)),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                    child: Text(
                      "{eventCategoryName}",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                   Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                    child: Text(App.dateFormet(model.event!.eventTimeSlots![0].startDateTime.toString()) + " to " +App.dateFormet(model.event!.eventTimeSlots![0].endDateTime.toString()),
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 107, 106, 106)),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  InkWell(
                    onTap: () => model.viewEvent(context),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(color: const Color(0xffFF2C9C), borderRadius: BorderRadius.circular(8.0)),
                        child: const Text(
                          "View event",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32.0),
                   Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                    child: Text(
                      "stay tuned for more exclusive events from ${model.vendor!.name}!",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                    child: Text("Team {channelName}", style: TextStyle(fontSize: 16)),
                  ),
                  const SizedBox(height: 16.0)
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/png/logo_2.png',
                      width: 250,
                      height: 150,
                    ),
                  ),
                  const Center(
                    child: Text(
                      "Get the Free {channelName} App",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffFF2C9C), fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    Image.asset(
                        'assets/png/google.png',
                        width: MediaQuery.of(context).size.width < 600 ? 150 : 150,
                      ),
                      
                    Image.asset(
                      'assets/png/apple.png',
                      width: MediaQuery.of(context).size.width < 600 ? 150 : 150,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                //spacing: 10.0,
                //runSpacing: 10.0,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'bubltown, ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '2a Woodcote Avenue, Wallington, Surrey, SM6 0QS\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: '\u00A9',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: '2022 ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: 'bubltown',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(0, 0); // move to first vertex
    path.lineTo(size.width, 0); // connect to second vertex
    path.lineTo(size.width, 100); // connect to third vertex
    path.lineTo(0, 130); // connect to fourth vertex
    path.close();
    canvas.drawPath(
      path,
      Paint()
        ..color = const Color(0xffFF2C9C)
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
