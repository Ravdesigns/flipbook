# Flipbook

Turn an A4 PDF (or a stack of PNG/JPG pages) into a real page-turning book, then
export the whole thing as **one self-contained `.html` file** you can email, AirDrop,
or drop on any server. No build step, no account, no internet needed to view it.

```
flipbook/
├─ index.html          the maker (drop pages → preview → export)
├─ flipbook.command    double-click to launch on a Mac
├─ README.md
└─ vendor/
   ├─ pdf.min.js            ┐ pdf.js 3.11.174 — rasterizes PDF pages (maker only)
   ├─ pdf.worker.min.js     ┘
   └─ page-flip.browser.js  StPageFlip 2.0.7 — the page-curl engine
```

## Run the maker

The maker rasterizes PDFs with pdf.js, which uses a Web Worker — that needs `http://`,
not a bare `file://` open. So serve the folder:

- **Mac:** double-click `flipbook.command`. It starts a local server and opens the page.
- **Anything:** `cd flipbook && python3 -m http.server 8500` then open
  <http://localhost:8500/index.html>.

Then: drop a PDF or PNG/JPG pages → reorder/trim in the strip → tweak settings →
**Download**. Or hit *Try a demo book* to see it with no upload.

## The exported file

The `.html` you download is the shareable artifact and it is genuinely standalone:

- pages are baked in as base64 images (no PDF, no pdf.js, no worker),
- the flip engine is inlined,
- the page-rustle is synthesized with the Web Audio API (no audio asset).

It opens by double-click anywhere and works fully offline. Recipients flip by
dragging a page corner, the on-screen arrows, or `←`/`→`, with a fullscreen and a
mute toggle.

## Settings

| Setting   | What it does |
|-----------|--------------|
| Layout    | **Book** (two-page spread on desktop, single page on mobile) or **Single** (one page, always) |
| Cover     | Treat the first page as a standalone cover |
| Page sound| Toggle the synthesized paper rustle on flip |
| Quality   | JPEG quality of the baked pages — trades sharpness against file size (live estimate next to *Download*) |

Long side of each page is capped at 1700px on export to keep files sane.

## Notes

- Everything runs in the browser. Files never leave the machine.
- A4 portrait is the happy path; other sizes work but the book frame assumes the A4 ratio (1 : 1.414).
- Built with the Zop.Dev system: cream paper, ink, a single orange mark; Space Grotesk / Inter / JetBrains Mono in the maker, a serif title in the exported viewer (system fonts so it stays offline).
