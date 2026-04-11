import 'package:flutter/material.dart';

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

    controller = TextEditingController(text: widget.initialZekr);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final controller = TextEditingController(text: widget.initialZekr);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isEditing = widget.initialZekr != null;
    return AnimatedPadding(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(context).dividerColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              isEditing ? "تعديل الذكر" : "إضافة ذكر",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
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
                fillColor: isDark
                    ? Colors.white.withAlpha(13)
                    : Colors.grey.withAlpha(13),

                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),

                // ===== Normal condition =====
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary.withAlpha(102),
                    width: 1,
                  ),
                ),

                // ===== When focusing =====
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
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
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        foregroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        Navigator.pop(context, "");
                      },
                      child: const Text("حذف"),
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
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey.shade300,
                          foregroundColor: isNotEmpty
                              ? (isDark ? Colors.black : Colors.white)
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
