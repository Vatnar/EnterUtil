──────────────────────────────
# EnterUtil

Lightweight tool for enabling shortcuts to insert lines above or below the cursor—and automatically placing the caret in the new line—similar to the "new line" methods found in JetBrains IDEs.

──────────────────────────────
## Config File: config.ini

Place the config.ini file in the same directory as EnterUtil.exe. Add any applications where you want to disable the custom enter logic (such as web browsers or Discord, which often handle enter differently) to the exclusion list.

Example configuration file:

```ini
[Exclusions]
Apps=Discord.exe,chrome.exe,firefox.exe
```

──────────────────────────────
How It Works:

• In applications not listed in the configuration file, pressing SHIFT+ENTER will insert a new line below the current line, while CTRL+ALT+ENTER will insert a new line above the current line and move the caret there.

• In any application specified in the [Exclusions] list, EnterUtil will not override the native behavior.

──────────────────────────────
