import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:stacked/stacked.dart';

import '../event/event_view_model.dart';

class FormView extends StatelessWidget {
  

  FormView({super.key});

  @override
  Widget build(BuildContext context) => ViewModelBuilder<EventViewModel>.reactive(
      viewModelBuilder: () => EventViewModel(),
      builder: (BuildContext context, EventViewModel model, Widget? child) =>  Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children:  [
              const Text("hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii"),
             // Text(model.event!.eventContactNumber! == null ? "null value came" : model.event!.eventContactNumber!.toString()),
               // Text(model.sample! == null ? "hi":"not null"),
            ],
          ),
        ),

      ),
  );
      
}