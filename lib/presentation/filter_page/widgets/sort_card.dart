import 'package:filter_test/core/constants.dart';
import 'package:filter_test/presentation/custom_widgets/multiple_selection_radio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/filter_page_bloc/filter_page_bloc.dart';
import '../../../domain/models/models.dart';
import '../../custom_widgets/custom_radio_tile.dart';

class SortCard extends StatefulWidget {
  final FilterPageLoaded state;
  const SortCard({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  State<SortCard> createState() => _SortCardState();
}

class _SortCardState extends State<SortCard> {
  @override
  Widget build(BuildContext context) {
    String selectedValue = widget.state.selectedSorting;
    return Card(
      shadowColor: Colors.transparent,
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30),
              child: Text(
                widget.state.sortList.name,
                style: ConstantTextStyles.headingStyle,
              ),
            ),
            Column(
              children: List.generate(
                widget.state.sortList.taxonomies.length,
                (index) {
                  final currentState = widget.state;
                  List<Taxonomy> currentTaxonomyList =
                      currentState.sortList.taxonomies;
                  Taxonomy currentTaxonomy = currentTaxonomyList[index];

                  bool isSelected = currentTaxonomy.name == selectedValue;
                  return GestureDetector(
                    child: RadioTile(
                        height: 35,
                        leading: MultipleSeletionRadioButton(
                          color: ConstantColors.kColorsPurple,
                          isSelected: isSelected,
                        ),
                        title: Row(
                          children: [
                            Text(
                              currentTaxonomyList[index].name!,
                              style: ConstantTextStyles.radioTextStyle,
                            ),
                            Visibility(
                                visible: currentTaxonomyList[index].slug! ==
                                    "nearest_to_me",
                                child: const Text(
                                  " (default)",
                                  style: TextStyle(color: Colors.grey),
                                ))
                          ],
                        )),
                    onTap: () {
                      context.read<FilterPageBloc>().add(SortingChangedEvent(
                          selectedFilters: currentState.selectedFilters,
                          filters: currentState.filters,
                          sortList: currentState.sortList,
                          selectedSorting: currentTaxonomy.name!));
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
