import 'package:flutter/material.dart';

import '../core/widget/custom_input_text.dart';
import '../core/widget/custom_step.dart';

class FormView extends StatefulWidget {
  const FormView({Key? key}) : super(key: key);

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stepper Widget ",
        ),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Stepper(
            type: StepperType.horizontal,
            currentStep: currentStep,
            onStepCancel: () => currentStep == 0
                ? null
                : setState(() {
                    currentStep -= 1;
                  }),
            onStepContinue: () {
              bool isLastStep = (currentStep == getSteps().length - 1);
              if (isLastStep) {
                //Do something with this information
              } else {
                setState(() {
                  currentStep += 1;
                });
              }
            },
            onStepTapped: (step) => setState(() {
              currentStep = step;
            }),
            steps: getSteps(),
          )),
    );
  }

  List<Step> getSteps() {
    return <Step>[
      CustomStep(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text("Account Info"),
        content: Column(
          children: const [
            CustomInput(
              hintText: "First Name",
              inputBorder: OutlineInputBorder(),
            ),
            CustomInput(
              hintText: "Last Name",
              inputBorder: OutlineInputBorder(),
            ),
          ],
        ),
      ),
      CustomStep(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text("Address"),
        content: Column(
          children: const [
            CustomInput(
              hintText: "City and State",
              inputBorder: OutlineInputBorder(),
            ),
            CustomInput(
              hintText: "Postal Code",
              inputBorder: OutlineInputBorder(),
            ),
          ],
        ),
      ),
      CustomStep(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: const Text("Misc"),
        content: Column(
          children: const [
            CustomInput(
              hintText: "Bio",
              inputBorder: OutlineInputBorder(),
            ),
          ],
        ),
      ),
    ];
  }
}
