

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'radio_cubit.dart';

class PlayWithStatemanagment3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RadioCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text("Radio Buttons with Cubit")),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return BlocBuilder<RadioCubit, int>(
                      builder: (context, selectedRadioIndex) {
                        return RadioListTile<int>(
                          title: Text('Option ${index + 1}'),
                          value: index,
                          groupValue: selectedRadioIndex,
                          onChanged: (value) {
                            context.read<RadioCubit>().selectRadio(value!);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
