import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';

class ZekrBottomSheet extends StatefulWidget {
  final String? initialZekr;

  const ZekrBottomSheet({super.key, this.initialZekr});

  @override
  State<ZekrBottomSheet> createState() => _ZekrBottomSheetState();
}

class _ZekrBottomSheetState extends State<ZekrBottomSheet> {
   late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller =
        TextEditingController(text: widget.initialZekr);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // final controller = TextEditingController(text: widget.initialZekr);
    final isEditing = widget.initialZekr != null;
    return AnimatedPadding(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              isEditing ? "تعديل الذكر" : "إضافة ذكر",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              autofocus: true,
              minLines: 1,
              maxLines: 4,
              textInputAction: TextInputAction.newline,

              decoration: InputDecoration(
                hintText: "اكتب الذكر هنا",

                // Light background
                filled: true,
                fillColor: Colors.grey.withValues(alpha: 0.05),

                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),

                // ===== Normal condition =====
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    color: AppColors.lightPrimary.withValues(alpha: 3.4),
                    width: 1,
                  ),
                ),

                // ===== When focusing =====
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: AppColors.lightPrimary,
                    width: 3,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                //Delete button (only appears if there is a mention)
                if (widget.initialZekr != null)
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context, "");
                      },
                      child: const Text(
                        "حذف",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),

                if (widget.initialZekr != null) const SizedBox(width: 10),

                // زر حفظ
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: controller,
                    builder: (context, value, _) {
                      final isNotEmpty = controller.text.trim().isNotEmpty;

                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isNotEmpty
                              ? AppColors.lightPrimary
                              : Colors.grey.shade300,
                          foregroundColor: isNotEmpty
                              ? Colors.white
                              : Colors.grey.shade600,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: isNotEmpty
                            ? () {
                                Navigator.pop(context, controller.text.trim());
                              }
                            : null,
                        child: const Text("حفظ"),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
