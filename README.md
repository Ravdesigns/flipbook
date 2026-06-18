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

## Three ways to share

- **Download** → a self-contained `.html` (the main artifact, see below).
- **Video** → records the flip-through as an `.mp4` (or `.webm`) clip — drop it
  straight into a LinkedIn/X post, where video autoplays.
- **Full screen** → the ⤢ button maximises the book (hides the editor chrome); the
  exported file has the same control for whoever opens it.

## The exported file

The `.html` you download is the shareable artifact and it is genuinely standalone:

- pages are baked in as base64 images (no PDF, no pdf.js, no worker),
- the flip engine is inlined,
- the page-rustle is synthesized with the Web Audio API (no audio asset).

It opens by double-click anywhere and works fully offline. Recipients flip by
dragging a page corner, the on-screen arrows, or `←`/`→`, with full-screen and a
mute toggle. The chosen background travels with it.

## Settings

| Setting   | What it does |
|-----------|--------------|
| Layout    | **Book** (two-page spread on desktop, single page on mobile) or **Single** (one page, always) |
| Background| Desk + page colour: **Greige** (warm grey-beige), **Light** (white), or **Slate** (dark — best for dark pages, so letterboxing blends instead of showing white bands) |
| Cover     | Treat the first page as a standalone cover |
| Page sound| Toggle the synthesized paper rustle on flip |
| Quality   | JPEG quality of the baked pages — trades sharpness against file size (live estimate next to *Download*) |

Long side of each page is capped at 1700px on export to keep files sane.

## Notes

- Everything runs in the browser. Files never leave the machine.
- The book takes its shape from the first page, so a deck of 16:9 slides becomes a 16:9 book and an A4 PDF becomes an A4 book. Pages that don't match that shape are centred on white (letterboxed), never stretched.
- Design system "Oxblood Editorial": warm greige paper, warm near-black ink, one oxblood accent. Fraunces (high-contrast serif) + Inter Tight + Spline Sans Mono in the maker; the exported viewer uses an offline system-serif stack (Didot / Hoefler → Georgia) so the shared file stays self-contained.
