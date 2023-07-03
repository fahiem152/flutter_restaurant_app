import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  final TextEditingController controller;
  final String pleaceholder;
  final bool isPassword;
  bool isPasswordVisible;
  TextInputWidget({
    Key? key,
    required this.controller,
    required this.pleaceholder,
    required this.isPassword,
    this.isPasswordVisible = true,
  }) : super(key: key);

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: widget.isPassword
          ? Row(
              children: [
                Expanded(
                  child: TextFormField(
                    obscureText: widget.isPasswordVisible,
                    controller: widget.controller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: widget.pleaceholder,
                        hintStyle:
                            const TextStyle(color: Colors.grey, fontSize: 12)),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      widget.isPasswordVisible = !widget.isPasswordVisible;
                    });
                  },
                  child: Icon(
                    widget.isPasswordVisible
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.grey,
                  ),
                )
              ],
            )
          : TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: widget.pleaceholder,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
    );
  }
}
