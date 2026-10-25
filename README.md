# face-detector

Browser-based **Face Lock** demo using [face-api.js](https://github.com/vladmandic/face-api). 

Face detection and recognition runs entirely in the browser. Face descriptors are stored only in `localStorage` on the device — nothing is sent to a server.

## Features
- Circular scanning UI with animated ring and mesh overlay
- Face enrollment (registers your face)
- Face verification / unlock
- Re-register or lock again
- Works on mobile and desktop (HTTPS required for camera)

## How to run
1. Open `index.html` in a browser (or deploy to GitHub Pages / Vercel).
2. Allow camera access.
3. Register your face, then lock and unlock.

**Note:** This is a demo, not bank-grade security. Matching uses Euclidean distance on face descriptors.

## Tech
- Pure HTML + CSS + JS
- `@vladmandic/face-api` from CDN
- Models loaded from jsDelivr

Live demo: open the repo and use GitHub Pages, or deploy the static file anywhere.