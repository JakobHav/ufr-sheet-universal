# UFR-Sheet-Universal

I improved my typst templete sheet for University of Freiburg submissions over the last semester and finally decided to pubish it in a universal Version :) 

## Install
To use it, just head to your package path and clone this Repository.

| OS          | Default local package path                            |
| ----------- | ----------------------------------------------------- |
| **macOS**   | `~/Library/Application Support/typst/packages/local/` |
| **Linux**   | `~/.local/share/typst/packages/local/`                |
| **Windows** | `%APPDATA%\typst\packages\local\`                     |

```bash
cd <path>
git clone https://github.com/JakobHav/ufr-sheet-universal.git
```

 Then, just add your config to your Typst file like this for a simple sheet:

```typst
#import "@local/ufr-sheet-universal:0.1.0": conf

#show: doc => conf(
  doc,
  subject: "Subject",
  date: "04.11.2025",
  prof: "Prof. Musterfrau",
  title: "Übungsblatt",
  name: "Mara Musterfrau", 
  rz: mm9999,
  matrikelnr: 5999999
)
```
## Settings
Here is a list of all parameters with their default values:

```typst
#show: doc => conf(
header: true,
header_start: 1,
numbering: "1",
number-align: center,
name: "",
rz: "",
matrikelnr: "",
title: "",
left_header: true,
subject: "",
semester: "",
prof: "",
date: "",
font_family: "New Computer Modern",
block_sentence: true,
)
``` 

Notable Settings: 
- You can replace the default left header with rz, mat, ... with `left_header: [],` and put your desired content into the content Block. If you do that, pay Attention to the header, which uses the name Variable.
- `header_start` describes, on what page number the headline with subject etc.. starts, you can disable it all together with `header: false`.
- `font_family: "New Computer Modern",` is a Font that looks quite similar to typical LaTeX, i made it default, but you can change to your desired font if you want.

## Have fun with it!
If you happen to find any errors or you would like any changes, you are more than welcome to open a pull request or an issue :)

I hope you'll enjoy my template
- Jakob
