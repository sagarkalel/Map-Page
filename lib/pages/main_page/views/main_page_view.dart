part of '../main_page.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainPageBloc, MainPageState>(
      listener: (context, state) {
        if (state is DataSavedSuccessfully) {
          /// go to map page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MapPage(),
            ),
          ).then(
            (_) {
              /// change state after coming back and unFocus
              context.read<MainPageBloc>().add(JustChangeState());
              Future.delayed(const Duration(milliseconds: 10))
                  .then((value) => FocusScope.of(context).unfocus());
            },
          );
        }
      },
      builder: (context, state) {
        final bloc = context.read<MainPageBloc>();
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(title: const Text('Sell Produce')),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    child: Form(
                      key: bloc.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// type of crop
                          const TitleWidget(text: 'Type of Crop'),
                          const YGap(8),
                          Row(
                            children: [
                              AppDropdown(
                                items: bloc.cropTypes,
                                hintText: 'Select Crop',
                                selectedValue: bloc.typeOfCrop,
                                onChanged: (p0) =>
                                    bloc.add(TextChange(cropType: p0)),
                              ).expand
                            ],
                          ),

                          /// crop type validation error
                          const YGap(4),
                          if (state is ValidationErrorState &&
                              bloc.cropTypeError != null)
                            ErrorTextWidget(
                              errorText: bloc.cropTypeError ?? '',
                            ),
                          const YGap(16),

                          /// variety of crop
                          const TitleWidget(text: 'Variety'),
                          AppTextField(
                            controller: bloc.varietyOfProductController,
                            onChanged: (val) =>
                                bloc.add(TextChange(variety: val)),
                            hintText: 'Variety of Product',
                            validator: (val) {
                              if (val == null || val.length < 3) {
                                return "Please enter valid variety";
                              }
                              return null;
                            },
                          ),
                          const YGap(16),

                          /// expected quantity of crop
                          const TitleWidget(text: 'Expected Quantity'),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextField(
                                controller: bloc.quantityController,
                                onChanged: (val) =>
                                    bloc.add(TextChange(quantity: val)),
                                hintText: 'Quantity',
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return "Please enter Quantity";
                                  }
                                  return null;
                                },
                              ).expand,
                              const XGap(16),
                              AppDropdown(
                                items: bloc.quantityUnits,
                                hintText: 'Select Unit',
                                selectedValue: bloc.quantityUnit,
                                onChanged: (p0) =>
                                    bloc.add(TextChange(quantityUnit: p0)),
                              ).padYTop(5),
                            ],
                          ),
                          const YGap(16),

                          /// price
                          const TitleWidget(text: 'Price (per Kg)'),
                          AppTextField(
                            controller: bloc.priceController,
                            hintText: 'Type your price',
                            onChanged: (val) =>
                                bloc.add(TextChange(price: val)),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Please enter Price";
                              }
                              return null;
                            },
                          ),
                          const YGap(16),

                          /// note
                          const TitleWidget(text: 'Note'),
                          AppTextField(
                            controller: bloc.noteController,
                            hintText: 'Write something',
                            onChanged: (val) => bloc.add(TextChange(note: val)),
                            validator: (val) {
                              if (val == null || val.length < 3) {
                                return "Please write a valid note";
                              }
                              return null;
                            },
                          ),
                          const YGap(16),

                          /// images
                          const TitleWidget(text: 'Images'),
                          const YGap(10),
                          Row(
                            children: [
                              ImageButton(
                                onTap: () => bloc.add(PickImage1()),
                                label: "Image 1",
                              ),
                              const XGap(16),
                              ImageButton(
                                onTap: () => bloc.add(PickImage2()),
                                label: "Image 2",
                              ),
                            ],
                          ),
                          const YGap(16),

                          /// note
                          const TitleWidget(text: 'Selected Images'),
                          const YGap(4),

                          /// displaying picked images
                          Row(
                            children: [
                              if (bloc.image1File != null)
                                DisplayImageWidget(file: bloc.image1File!),
                              const XGap(16),
                              if (bloc.image2File != null)
                                DisplayImageWidget(file: bloc.image2File!),
                            ],
                          ),

                          /// image validation error
                          const YGap(4),
                          if (state is ValidationErrorState &&
                              bloc.image1Error != null)
                            ErrorTextWidget(
                              errorText: bloc.image1Error ?? '',
                            ),
                          if (state is ValidationErrorState &&
                              bloc.image2Error != null)
                            ErrorTextWidget(
                              errorText: bloc.image2Error ?? '',
                            ),
                          const YGap(16),
                        ],
                      ),
                    ),
                  ).expand,

                  const YGap(16),

                  /// save button
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () => bloc.add(SaveFieldData()),
                        child: const Text('Add my Produce'),
                      ).expand,
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
