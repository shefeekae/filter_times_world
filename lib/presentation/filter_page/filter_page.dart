// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:filter_test/core/constants.dart';
import 'package:filter_test/presentation/custom_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/filter_page_bloc/filter_page_bloc.dart';
import 'widgets/filter_list_widget.dart';
import 'widgets/selected_filters_widget.dart';
import 'widgets/sort_card.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  void initState() {
    context.read<FilterPageBloc>().add(FilterPageInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        title: Text(
          ConstantText.title,
          style: ConstantTextStyles.titleStyle,
        ),
      ),
      body: BlocBuilder<FilterPageBloc, FilterPageState>(
        builder: (context, state) {
          return state is FilterPageLoaded
              ? Stack(children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Column(
                        children: [
//==============================================================================
//Selected Filters                              
                          state.selectedFilters.isNotEmpty
                              ? SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * .05,
                                  child: SelectedFiltersWidget(
                                    currentState: state,
                                  ),
                                )
                              : const SizedBox(),
//==============================================================================
//Sort By                               
                          SortCard(state: state),
//==============================================================================
//Filter Categories                             
                          FilterListWidget(state: state),
                          const SizedBox(
                            height: 80,
                          ),
                        ],
                      ),
                    ),
                  ),
                  
//==============================================================================
//Show result button                    
                  CustomElevatedButton(
                    title: 'SHOW 0 RESULTS',
                    onPressed: () {},
                  ),
                ])
              : const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
        },
      ),
    );
  }
}
