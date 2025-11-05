# UFR-Sheet-Universal

My first typst template and a pretty simple motivation: I always use the same template to type my worksheets (and notes) in typst, it is quite pretty with my Universitys Logo. So I made a quick template :) 

To Start, just head to your package path and git clone this Repository.
| OS          | Default local package path                            |
| ----------- | ----------------------------------------------------- |
| **macOS**   | `~/Library/Application Support/typst/packages/local/` |
| **Linux**   | `~/.local/share/typst/packages/local/`                |
| **Windows** | `%APPDATA%\typst\packages\local\`                     |

 Then, just add your Config to your Typst file like so:

```typst
#import "@local/ufr-sheet-universal:0.1.0": conf

#show: doc => conf(
  doc,
  subject: "Subject",
  date: "04.11.2025",
  prof: "Prof. Musterfrau",
  title: "Übungsblatt",
  name: "Mara Musterfrau",
)
```
