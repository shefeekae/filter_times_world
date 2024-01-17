import 'package:filter_test/application/filter_page_bloc/filter_page_bloc.dart';
import 'package:filter_test/core/filter_helper.dart';
import 'package:flutter/material.dart';

class SelectedFiltersWidget extends StatelessWidget {
  final FilterPageLoaded currentState;
  const SelectedFiltersWidget({super.key, required this.currentState});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  children: [
                    const Icon(
                      Icons.close,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                        child: Text(currentState.selectedFilters[index].name!)),
                  ],
                )),
            onTap: () => FilterHelper.remover(
                context, currentState, currentState.selectedFilters[index]),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
          itemCount: currentState.selectedFilters.length,
        ),
      ),
    );
  }
}
