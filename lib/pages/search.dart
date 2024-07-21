import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import '/components/icons.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Flex(
            direction: Axis.horizontal,
            children: [
              Text(
                'Delulu',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.share),
                      iconSize: 32,
                      onPressed: () {
                        Share.share('Check out this cool app!');
                      },
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(Icons.account_circle_outlined),
                      iconSize: 32,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          );
        } else if (index % 2 != 0) {
          return SizedBox(height: 64);
        } else if (index == 2) {
          return SearchBox();
        } else if (index == 4) {
          return Placeholder();
        } else {
          return null;
        }
      },
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          TextField(
            minLines: 2,
            maxLines: 8,
            autocorrect: true,
            enableSuggestions: true,
            spellCheckConfiguration: SpellCheckConfiguration(
              misspelledSelectionColor: Colors.redAccent,
              spellCheckService: DefaultSpellCheckService(),
            ),
            cursorColor: Colors.white70,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12),
              hintText: 'Ask anything...',
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                letterSpacing: 0.3,
                color: Colors.white24,
              ),
              border: InputBorder.none,
            ),
          ),
          Flex(
            direction: Axis.horizontal,
            children: [
              SizedBox(width: 5),
              TextBoxIcon(
                Icons.filter_center_focus_rounded,
                "Field",
              ),
              SizedBox(width: 12),
              TextBoxIcon(
                Icons.add_circle_outline_rounded,
                "Attach",
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) {
                          return Placeholder();
                        }),
                      );
                    },
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.zero),
                      iconSize: WidgetStatePropertyAll(20),
                      // overlayColor:
                      //     MaterialStatePropertyAll(Colors.transparent),
                      foregroundColor:
                          WidgetStateProperty.resolveWith((states) {
                        if (states.contains(WidgetState.hovered)) {
                          return Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer;
                        } else {
                          return Theme.of(context).colorScheme.primary;
                        }
                      }),
                    ),
                    icon: Icon(Icons.send_rounded),
                  ),
                ),
              )
            ],
          ), // Button
        ],
      ),
    );
  }
}