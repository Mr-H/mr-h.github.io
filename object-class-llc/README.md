# Object Class LLC — Microsite

This is a small static microsite for Object Class LLC, a technology consulting startup focused on game development tooling and professional services.

Structure
- `index.html` — Home with hero
- `about.html`, `services.html`, `contact.html` — basic pages
- `assets/css/main.css` — site stylesheet
- `assets/images/` — SVG assets (logo, hero)

Preview locally
```powershell
cd 'object-class-llc'
python -m http.server 8000
# Open http://localhost:8000
```

GitHub Pages
- To host on GitHub Pages with no server-side components, either:
  - Create a repository named `object-class-llc.github.io` and push the site files to the `main` branch (site will be served at https://object-class-llc.github.io), or
  - Add this project to the `docs/` folder of any GitHub repo and enable Pages to serve from `main` branch `/docs`.

Customization
- Update `assets/css/main.css` for brand colors and spacing.
- Replace `assets/images/hero.svg` and `logo.svg` with production assets.

License
- This scaffold is provided without license; add your project's license as appropriate.
