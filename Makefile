PNGS = $(wildcard static/images/*.png)
WEBPS = $(patsubst static/images/%.png, static/images/%.webp, $(PNGS))

compress: $(WEBPS)

serve:
	hugo server --buildDrafts --bind="0.0.0.0" --baseURL 192.168.1.155

tailwind:
	npm run watch

static/images/%.webp: static/images/%.png
	cwebp -q 100 $< -o $@

build:
	npm run build
	hugo
