import 'package:flutter/material.dart';

class CustomSerachField extends StatelessWidget {
  const CustomSerachField.customSearchField({
    super.key,
    required this.textEditingController,
    this.onChanged,
  });
  final TextEditingController textEditingController;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
      child: TextField(
        controller: textEditingController,
        onChanged: onChanged,
        autofocus: false,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: Colors.white,
              )),
          hintText: 'Search',
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          hintStyle:
              const TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
        ),
      ),
    );
  }
}
